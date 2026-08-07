{ pkgs, ... }: {
  home.packages = [
    (pkgs.writeShellApplication {
      name = "show-tray-items";
      text = ''
        set -uo pipefail

        raw=$(busctl --user get-property \
          org.kde.StatusNotifierWatcher \
          /StatusNotifierWatcher \
          org.kde.StatusNotifierWatcher \
          RegisteredStatusNotifierItems)

        # 只保留形如 "xxx/yyy" 的真正 item 条目，过滤掉空匹配
        items=$(echo "$raw" | grep -oP '"\K[^"]+' | grep -F '/')

        if [ -z "$items" ]; then
          echo "没有找到任何托盘项"
          exit 0
        fi

        while IFS= read -r item; do
          [ -z "$item" ] && continue

          bus="$\{item%%/*}"
          path="/$\{item#*/}"

          id_raw=$(busctl --user get-property "$bus" "$path" \
                org.kde.StatusNotifierItem Id 2>/dev/null || true)

          id=$(echo "$id_raw" | sed -E 's/^[a-z]+ //; s/^"//; s/"$//')

          if [ -z "$id" ]; then
            id="(获取失败)"
          fi

          
          printf "%-20s %s\e[32m%s\e[0m\n" "$id" "$bus" "$path"
        done <<< "$items"
      '';
    })
  ];
}
