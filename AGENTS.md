# AGENTS.md

多设备的个人 NixOS 配置，命名为 **funkcia**。

本文件只写**约定与流程**（不该随时间漂移的东西）。目录结构、设备列表、flake
inputs、 CI、可用的 skill 这类事实会变，不要靠记忆，先现查：

```bash
ls parts/ packages/ devices/ modules/ home/ scripts/  # 各层有什么
cat flake.nix                                         # inputs 与设备接线
nix flake show                                        # flake 的所有输出
ls .github/workflows/                                 # CI
ls .agents/skills/                                    # 可用的 agent skill
cat utils/files.nix utils/magic.nix                   # funkcia-utils 的 API
cat README.md                                         # 路径约定（自动生成）
fd 'secrets\.yaml$'                                   # sops 加密文件的位置
```

（`README.md` 的“路径约定”由 `nu scripts/readme-tree-gen/app.nu` 生成，别手
改。）

## 结构约定

flake 用 flake-parts 组织。分层决定了改动该放哪：

- 共享 NixOS 模块 → `modules/`（导出 `nixosModules.default`）
- 共享 Home Manager 模块 → `home/modules/`（导出 `homeModules.default`）
- 设备专属 → `devices/<hostname>/`
- 用户专属 → `home/<user>/`
- 对所有设备/用户生效的上游修复（`overrideAttrs`）→ `fixes/`（被前置注入）

`parts/` 是 flake-parts 模块（定义 flake 输出与自定义选项），`packages/` 下每个
子目录是一个 `perSystem.packages.<name>` 并导出同名 overlay。两者都由
`flake.nix` 自动导入。

`modules/`、`home/modules/`、`fixes/` 都是递归自动导入（`mkRecDirModule`）；
`devices/<name>/configuration.nix` 与 `home/<user>/home.nix` 用
`funkcia-utils.files.mkDirModule` / `mkRecDirModule` 导入同层目录。这些工具的具
体行为看 `utils/files.nix`。

## 名称与开关约定

这是写配置时最重要的约定：

- `funkcia.os.*` 存放 NixOS 范围的配置，`funkcia.hm.*` 存放 Home Manager 范围的
  配置。
- 共享能力写在共享模块里，用 `lib.mkEnableOption` 定义开关、`lib.mkIf
  cfg.enable` 守护配置；设备/用户在各自的 `configuration.nix` / `home.nix` 里
  opt-in： `funkcia.os.<name>.enable = true;`。
- 只为单一设备做的配置无需抽象，直接放在该设备的目录里。当出现两台设备共享同一份
  配置时，再把它抽象成一个共享的服务配置（`funkcia.os.*` 开关），由各设备
  opt-in。
- 用户级开关以**用户名**为命名空间（`<username>.*`），例如用户名 linca 的
  `linca.play`、`linca.work`、`linca.sops`。
- GUI 程序放该用户的 `home/<username>/gui/`（而非 `programs/`），每份配置自己用
  `funkcia.hm.gui.enable` 守护。

## 不要过度求证

回答或做事时，投入的精力与任务本身相称。用户只是让你解释一个概念、问一个「怎么
做」时，直接用已有知识回答即可；**不要**为了求证众所周知的行为去 curl/阅读上游源
码、翻手册、做多轮实验，也不要为了显得严谨而堆砌引用。只有在以下情况才需要深入调
查：

- 用户明确要求查证或给出依据；
- 这会写进仓库、改动真实配置，且正确性无法凭常识判断；
- 现有知识确实不足以给出可靠答案。

不要用大段源码和长上下文来回答一个几句话能说清的问题。

## 使用现代化的 cli 工具和脚本

该系统已经配置了使用更现代的 CLI 工具，包括 `fd`, `fzf`, `rg`, `eza`, `bat`,
`nushell` 等。可选地，可以使用这些现代化的 CLI 工具来完成各种搜索、替换等需求。

推荐使用 javascript 和 python 进行脚本处理，优先使用 javascript 和 bun 运行时。
该系统没有 system-wide python，使用 `uv run <script>.py` 运行 python 脚本。该系
统 system-wide nodejs 版本很高，在新版本 nodejs 中，typescript 可以直接被运行。
使用 bun 和 nodejs 可以无需 `tsc` 对 typescript 脚本运行。

## 如何添加、修改一个系统功能

在该项目中，当用户说“帮我安装”的时候，默认指的是用 Nix 的方式安装，应该先在本地
和互联网上搜索是否有 Nix 的解决方案。如果没有，再询问用户如何解决。对于有 Nix 的
解决方案，应当：

0. 确定当前机器。使用 `hostname` 确定当前机器名（在本仓库中设备名总是等于
   hostname）。

1. 确定模块范围。判断这属于哪一层配置（见上文“结构约定”）。

   若改动全局共享模块，会影响所有设备，先向用户确认影响面；若只涉及
   `devices/name/` 或 `home/name/`，可直接进行。

2. 先搜索是否有现成模块。在项目本地用 `rg` 搜现成的 `funkcia.os.` /
   `funkcia.hm.` 开关与实现。如果有共用模块，思考对它修改会造成多少影响。

3. 引入包、选项、模块之前，先搜索。

**不要自己造轮子**

- home-manager 选项：`nh search options {keyword} --scope=home-manager`
- NixOS 选项：`nh search options {keyword} --scope=nixpkgs`
- 都搜不到再找包：`nh search packages {keyword}`

能用 options 打开的，不要用添加包的方式打开。能复用现成 options 的，不要自己造轮
子。写 `mkOption` 时优先复用 `lib.types.*` 与 `pkgs.formats.<fmt>
{}.type/.generate`，参考 `.agents/skills/write-option`。

## 求值与隔离测试

不是所有改动都值得 build 整个系统。多数情况下先用求值确认选项/类型正确：

```bash
nix eval .#nixosConfigurations.HOST.config.<option>          # 单值
nix eval --json .#nixosConfigurations.HOST.config.<option>   # JSON（列表/结构体）
nix eval --raw  .#nixosConfigurations.HOST.config.<option>   # 字符串
```

home-manager 选项挂在
`nixosConfigurations.HOST.config.home-manager.users.USER.*`。

隔离测试单个模块（不加载整机）：

```bash
nu scripts/test-module/app.nu /tmp/example.nix
```

`.agents/skills/` 下有更详细的排查清单与陷阱。

## 构建和测试

重要：在构建和测试前，由于 flake 的特性，必须 `git add` 新增的文件，否则文件不生
效。

只为**本机**（`hostname`）做完整构建；其他设备的 host 跳过 build（会下载大
closure），改用上面的求值验证。

使用

```bash
nh os build .#device-name -o result-{device-name}
```

构建。对于本机，额外使用

```bash
nvd diff result-{device-name} /run/current-system
```

计算差异，防止配置更改产生不必要的变化。

如果用户需要 switch 系统，使用 `nh os switch --elevation-strategy
/run/current-system/sw/bin/run0` 使用 run0 提权。仓库根的 `apply.sh` 是另一条路
径，看该文件。

## 提交

### 检查 lint

在提交前，先在根目录运行

```bash
nu scripts/lint/app.nu
```

检查 format 和 lint 问题；使用

```bash
nu scripts/lint/app.nu -f
```

自动修复可以修复的问题。

### 更新 README.md

在提交前，使用 `nu scripts/readme-tree-gen/app.nu` 自动重新生成“路径约定”章节。

### Commit 格式规范

- 作为 NixOS 配置仓库，传统的 `feat` `refactor` 之类的 type 没有意义，不写
- 使用 `part (scope): subject` 作为格式
- part 是改动的哪个部位。下面列出一些例子：
  - 改动 `devices/legion-82tf` 时，part 是 `legion-82tf`
  - 改动 `devices/legion-82tf/home/linca` 时，part 是 `legion-82tf/linca`
  - 改动 `packages/commit` 时，part 是 `package`
  - 改动 `parts/doc` 时，part 是 `parts`
- 最前面加一个与改动最贴切的 emoji，后接一个空格
- subject 的语言与改动内容保持一致，不超过 72 个字符
- 确有需要时，空一行后补充正文

例如：`✨ package (commit): 生成带 emoji 前缀的 commit message`

仓库自带 `commit` 命令可用来按上述格式生成 commit message，用法看
`packages/commit/`。

### Agent 共同作者

当且仅当当前改动的**内容**而非 commit message 是由 Agent 生成的时候，commit 记录

```
Co-Authored-By: 模型名 <使用的 agent 对应的 github bot（如果你知道自己是谁）>
```

例如，`Co-Authored-By: Claude Sonnet 4`

如果你不知道自己对应的 Github bot，则不添加邮箱。

## 安全须知

被 sops 引用的 `secrets.yaml` 内包含敏感的 token 等内容，**永远不要擅自操作**，
无论是解密还是修改。不要尝试在用户的 shell 记录内查找敏感内容。将这些工作交给用
户自己完成。

## Agent 工具配置

`.commandcode/`、`.pi/`、`.agents/`、`opencode.json` 是本仓库的 agent 配置，纳入
版本管理（`.pi/tasks` 除外）。`.commandcode/taste/` 是学习到的用户偏好，只读，勿
手改。
