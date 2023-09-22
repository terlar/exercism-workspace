{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    gleam --version

    echo
    echo Run the tests with:
    echo 'gleam test'
  '';
  scripts.exercism-test.exec = "gleam test";

  languages.gleam.enable = true;

  packages = [
    pkgs.erlang
    pkgs.rebar3
  ];
}
