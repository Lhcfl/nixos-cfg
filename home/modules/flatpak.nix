{
  lib,
  osConfig,
  config,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.hm.flatpak;
in
{
  options.funkcia.hm.flatpak = {
    enable =
      lib.mkEnableOption ''
        manage the user-level Flatpak overrides under `~/.local/share/flatpak/overrides` declaratively.
      ''
      // {
        default = osConfig.funkcia.os.flatpak.enable or false;
        defaultText = lib.literalExpression "osConfig.funkcia.os.flatpak.enable or false";
      };

    overrides = lib.mkOption {
      type = lib.types.attrsOf lib.types.json;
      default = { };
      example = {
        "com.tencent.WeChat".Environment = {
          LANG = "zh_CN.UTF-8";
          LC_CTYPE = "zh_CN.UTF-8";
        };
      };
      description = ''
        Flatpak overrides keyed by application ID, or `global` to apply to every
        application. Each entry is written to
        `~/.local/share/flatpak/overrides/<name>` in Flatpak's INI format.
      '';
    };

    mountNixStore = lib.mkEnableOption ''
      expose the host `/nix/store` read-only inside every Flatpak
      sandbox through a global override.

      NixOS keeps themes, cursors and other resources under `/nix/store`, which
      is invisible to Flatpak sandboxes by default. Mounting it fixes issues
      such as missing X11 cursor themes; the trade-off is that every sandboxed
      application gains read access to the whole store.
    '';

    mountFontConfig =
      lib.mkEnableOption ''
        make the host's `fonts.fontconfig.defaultFonts` preferences
        visible to every Flatpak sandbox through a global override.
      ''
      // {
        default = true;
      };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        xdg.dataFile = lib.mapAttrs' (name: value: {
          name = "flatpak/overrides/${name}";
          value.text = lib.generators.toINI {
            mkKeyValue = lib.generators.mkKeyValueDefault {
              mkValueString =
                v:
                let
                  mk = lib.generators.mkValueStringDefault { };
                in
                if lib.isList v then (builtins.concatStringsSep ";" (map mk v)) + ";" else mk v;
            } "=";
          } value;
        }) cfg.overrides;
      }

      (lib.mkIf cfg.mountNixStore {
        funkcia.hm.flatpak.overrides.global.Context.filesystems = [ "/nix/store:ro" ];
      })

      (lib.mkIf cfg.mountFontConfig {
        funkcia.hm.flatpak.overrides.global =
          let
            defaults = osConfig.fonts.fontconfig.defaultFonts;

            mkGenericAlias = generic: families: ''
              <alias binding="same">
                <family>${generic}</family>
                <prefer>
              ${lib.concatMapStrings (family: "<family>${family}</family>\n") families}  </prefer>
              </alias>
            '';

            # 注入沙箱的 fontconfig 片段：先 include 沙箱自己的 base 配置
            # （保住 /run/host/fonts、flatpak 的 remap-dir 等），再补上宿主的默认字体偏好。
            fontconfigFragment = pkgs.writeText "flatpak-fonts.conf" /* xml */ ''
              <?xml version="1.0"?>
              <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
              <fontconfig>
                <include ignore_missing="yes">/etc/fonts/fonts.conf</include>
                ${mkGenericAlias "sans-serif" defaults.sansSerif}
                ${mkGenericAlias "serif" defaults.serif}
                ${mkGenericAlias "monospace" defaults.monospace}
                ${mkGenericAlias "emoji" defaults.emoji}
              </fontconfig>
            '';
          in
          {
            Context.filesystems = [ "${fontconfigFragment}:ro" ];
            Environment = {
              FONTCONFIG_FILE = fontconfigFragment;
            };
          };
      })
    ]
  );
}
