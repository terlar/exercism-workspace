{pkgs, ...}: {
  packages = [pkgs.bats];
  pre-commit.hooks.shellcheck.enable = true;
}
