{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    go version

    echo
    echo Run the tests with:
    echo 'go test'

    export GOPATH="$PWD"
  '';
  scripts.exercism-test.exec = "go test";

  languages.go.enable = true;

  packages = [
    pkgs.gopls
    pkgs.gore
  ];
}
