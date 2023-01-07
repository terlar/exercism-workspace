{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    go version

    echo
    echo Run the tests with:
    echo 'go test'
  '';
  scripts.test-all.exec = "go test";

  languages.go.enable = true;

  packages = [pkgs.gore];
}
