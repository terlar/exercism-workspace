{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    gleam --version

    echo
    echo Run the tests with:
    echo 'gleam test'
  '';
  scripts.test-all.exec = "gleam test";

  languages.gleam.enable = true;

  packages = [
    pkgs.erlang
    pkgs.rebar3
  ];
}
