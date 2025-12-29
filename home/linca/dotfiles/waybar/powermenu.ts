import { spawn } from "bun";

const options = {
    "Power Off (关机)": "poweroff",
    "Reboot (重启)": "reboot",
    "Suspend (睡眠)": "systemctl suspend",
    "Hibernate (休眠)": "systemctl hibernate",
    "Logout (登出)": "hyprctl dispatch exit",
    "Lock (锁定)": "hyprlock"
}

const handle = Bun.spawn({
    cmd: ["vicinae", "dmenu"],
    stdin: new Blob(Object.keys(options).map(x => x + "\n")),
});

const selected = await handle.stdout.text().then(text => text.trim());

if (selected in options) {
    spawn({
        cmd: ["sh", "-c", options[selected as keyof typeof options]],
    });
}