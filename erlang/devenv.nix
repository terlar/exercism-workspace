{pkgs, ...}: {
  languages.erlang.enable = true;

  packages = [pkgs.rebar3];
}
