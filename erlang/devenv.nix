{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    rebar3 --version

    echo
    echo Run the tests with:
    echo 'rebar3 eunit'
  '';
  scripts.exercism-test.exec = "rebar3 eunit";

  languages.erlang.enable = true;

  packages = [pkgs.rebar3];
}
