{pkgs, ...}: {
  languages.go.enable = true;

  packages = [pkgs.gore];

  pre-commit.hooks.govet.enable = true;
}
