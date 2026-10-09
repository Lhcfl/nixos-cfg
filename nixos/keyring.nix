#   funkcia.os.keyring.enable = true;
#   funkcia.os.keyring.provider.gnome-keyring = { };        # 默认
#   funkcia.os.keyring.provider.oo7.tpm2.enable = true;
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.os.keyring;
in
{
  options.funkcia.os.keyring = {
    enable = lib.mkEnableOption "Secret Service, an API on D-Bus to allow applications to store secrets securely.";

    provider = lib.mkOption {
      description = "Secret Service 的实现，只能选一个。";
      default = {
        gnome-keyring = { };
      };
      example = {
        oo7.tpm2.enable = true;
      };
      type = lib.types.attrTag {
        gnome-keyring = lib.mkOption {
          description = ''
            用 gnome-keyring, GNOME 的 Secret Service 实现。只能靠登录口令解锁 keyring，
            指纹登录不行。see <https://wiki.nixos.org/wiki/Secret_Service>
          '';
          type = lib.types.submodule { };
        };
        oo7 = lib.mkOption {
          description = ''
            用 oo7, 一个 Rust 编写的 D-Bus Secret Service 提供程序，旨在作为 gnome-keyring
            的轻量级跨桌面替代方案。see <https://github.com/linux-credentials/oo7>
          '';
          type = lib.types.submodule {
            options.tpm2.enable = lib.mkEnableOption "用 TPM2 封装的 systemd credential 解锁 keyring（会装一个 {command}`oo7-store-keyring-password`，跑一次即可）";
          };
        };
      };
    };
  };

  config = lib.mkIf cfg.enable (
    let
      pams = [
        "login"
        "greetd"
      ];
    in
    lib.mkMerge [
      (lib.mkIf (cfg.provider ? gnome-keyring) {
        environment.systemPackages = with pkgs; [
          gnome-keyring
          libsecret
        ];

        services.gnome.gnome-keyring.enable = true;
        # disable gcr-ssh-agent because it can conflict with other ssh agents
        services.gnome.gcr-ssh-agent.enable = false;

        security.pam.services = lib.listToAttrs (
          map (name: {
            inherit name;
            value.enableGnomeKeyring = true;
          }) pams
        );
      })

      (lib.mkIf (cfg.provider ? oo7) {
        # 启用了 niri 之类模块时会 mkDefault 打开 gnome-keyring，两个 Secret Service
        # 实现会抢 org.freedesktop.secrets，所以显式关掉（gcr-ssh-agent 的默认值跟着
        # gnome-keyring 走，也会跟着关掉）。
        services.gnome.gnome-keyring.enable = false;

        services.oo7.enable = true;

        # oo7-portal 的 portal 文件只声明 UseIn=gnome，非 GNOME 会话选不到它，所以显式
        # 指定 portal.Secret 的实现。名字取 portal 文件的主文件名（oo7-portal.portal）。
        # portals.conf 是按接口逐级回退的，这里只写 Secret 一个键，其它接口不受影响。
        xdg.portal.config = {
          common."org.freedesktop.impl.portal.Secret" = "oo7-portal";
        }
        // lib.optionalAttrs config.programs.niri.enable {
          # nixpkgs 的 niri 模块把 Secret 指给 gnome-keyring，而这个分支里它不在系统里
          niri."org.freedesktop.impl.portal.Secret" = lib.mkForce "oo7-portal";
        };

        security.pam.services = lib.listToAttrs (
          map (name: {
            inherit name;
            value.oo7.enable = true;
          }) pams
        );
      })

      (lib.mkIf (cfg.provider.oo7.tpm2.enable or false) (
        let
          # keyring 口令存成的文件（systemd credential）的名字。名字是 oo7 上游定的：
          # oo7-server 的 user unit `share/systemd/user/oo7-daemon.service` 里写着
          #   ImportCredential=oo7.keyring-encryption-password
          # nixpkgs 的 services.oo7 只是把这个 unit 原样装上去（systemd.packages），
          # 所以名字改不了。有了这一行，systemd --user 会去
          # ~/.config/credstore.encrypted/（`systemd-path user-credential-store-encrypted`）
          # 找同名文件、解密后通过 $CREDENTIALS_DIRECTORY 交给 oo7-daemon 解锁 keyring。
          # 加密的 user credential 是 systemd 258 才支持的（之前只有 system 服务能用）。
          credentialName = "oo7.keyring-encryption-password";

          # 一次性命令：交互式问一遍 keyring 口令，加密后写进上面的文件，之后 daemon
          # 每次启动都能自己解密。
          # --user 把口令绑到 (TPM2, machine-id, uid, username)，只有本机本人和 root 解
          # 得开（把「知道口令」弱化成「本机 + 可解密」）；解密是 systemd 的
          # systemd-creds.socket 服务做的，用户自己不需要 TPM 权限。
          storeKeyringPassword = pkgs.writeShellApplication {
            name = "oo7-store-keyring-password";
            runtimeInputs = [ config.systemd.package ];
            text = ''
              set -eu

              target="''${XDG_CONFIG_HOME:-$HOME/.config}/credstore.encrypted/${credentialName}"
              mkdir -p "$(dirname "$target")"

              if [ -e "$target" ]; then
                echo "overwriting $target" >&2
              fi

              systemd-ask-password -n "Keyring password for oo7: " \
                | systemd-creds encrypt --user --name="${credentialName}" - "$target"

              echo "wrote $target"
            '';
          };
        in
        {
          environment.systemPackages = [ storeKeyringPassword ];

          # 从用户 credstore 读 credential 是 systemd 258 加的。
          assertions = [
            {
              assertion = lib.versionAtLeast config.systemd.package.version "258";
              message = "funkcia.os.keyring.provider.oo7.tpm2.enable 需要 systemd >= 258，当前是 ${config.systemd.package.version}。";
            }
          ];
        }
      ))
    ]
  );
}
