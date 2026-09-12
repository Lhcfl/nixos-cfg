def main [path] {
    nix eval -f ($env.FILE_PWD + "/tester.nix") -I $"input-file=($path)"
}