## 临时文件存放位置

对于仅仅只用到一次的临时文件，仍然应当放在 /tmp 下。如果临时文件需要给用户审阅和
交互，可以放在 ~/once 这个文件夹的新文件夹下。

## GUI 相关

这台电脑安装了两个 wayland compositor:
[umbriel](https://docs.noctalia.dev/umbriel) 和 niri. umbriel 是一个很新的
scrolling layout 的 compositor。

配合 compositor 的是 noctalia shell，使用 `noctalia msg --help` 查看可用命令。

没有安装其他截图工具，你可以使用 `noctalia msg screenshot-fullscreen` 进行截图。
类似的截图命令请通过 `noctalia msg --help | rg screenshot` 查询。注意，不要使用
interactive 的截图工具。
