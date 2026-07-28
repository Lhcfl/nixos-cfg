set -euo
sudo nixos-rebuild switch
bun home/linca/sync/sync.ts
