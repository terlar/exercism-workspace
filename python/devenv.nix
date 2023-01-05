{
  pkgs,
  config,
  ...
}: {
  languages.python.enable = true;

  packages = with config.languages.python.package.pkgs; [
    black
    ipython
    mypy
    pytest

    pkgs.pyright
  ];

  pre-commit.hooks.black.enable = true;
}
