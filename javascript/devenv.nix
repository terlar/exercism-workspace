{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    echo "bun $(bun --version)"

    echo
    echo Run the tests with:
    echo 'bun test'
  '';
  scripts.exercism-test.exec = "bun test";

  languages.javascript.enable = true;

  packages = [
    pkgs.bun
    pkgs.nodePackages.typescript-language-server
  ];
}
