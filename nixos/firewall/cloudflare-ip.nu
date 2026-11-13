# 刷新 nftables 里的 cloudflare_v4 / cloudflare_v6 集合。
#
# 由 devices/flying-fish/firewall.nix 通过 systemd timer 调用；运行环境中
# PATH 里需要有 nft（模块里用 systemd 的 path 选项注入 pkgs.nftables）。
# 用一次 `nft -f -` 事务提交全部改动，fetch 失败时直接报错退出，不会清空集合。

# Cloudflare 官方回源地址段 API，一次返回 ipv4_cidrs 与 ipv6_cidrs。
const IPS_URL = 'https://api.cloudflare.com/client/v4/ips'
const TABLE = 'inet nixos-fw'

# 生成原子更新两个集合的 nft 脚本
def build-rules [v4: list<string> v6: list<string>] {
    [
        $"flush set ($TABLE) cloudflare_v4"
        ...($v4 | each {|cidr| $"add element ($TABLE) cloudflare_v4 { ($cidr) }" })
        $"flush set ($TABLE) cloudflare_v6"
        ...($v6 | each {|cidr| $"add element ($TABLE) cloudflare_v6 { ($cidr) }" })
    ] | str join (char nl)
}

def main [] {
    let ranges = (http get --max-time 30sec $IPS_URL | get result)
    let v4: list<string> = $ranges.ipv4_cidrs
    let v6: list<string> = $ranges.ipv6_cidrs

    if ($v4 | is-empty) or ($v6 | is-empty) {
        error make { msg: 'failed to fetch Cloudflare IP ranges' }
    }

    let rules = [
        $"flush set ($TABLE) cloudflare_v4"
        $"add element ($TABLE) cloudflare_v4 { ($v4 | str join ", ") }"
        $"flush set ($TABLE) cloudflare_v6"
        $"add element ($TABLE) cloudflare_v6 { ($v6 | str join ", ") }"
    ] | str join (char nl)
    
    print $rules
    $rules | nft -f -

    if $env.LAST_EXIT_CODE != 0 {
        error make { msg: $"nft failed with exit code ($env.LAST_EXIT_CODE)" }
    }
}
