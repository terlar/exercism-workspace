{
  pkgs,
  config,
  ...
}: {
  imports = [../common.nix];

  enterShell = ''
    python --version
    pytest --version

    echo
    echo Run the tests with:
    echo 'pytest *_test.py'
  '';
  scripts.test-all.exec = "pytest *_test.py";

  languages.python.enable = true;

  packages = with config.languages.python.package.pkgs; [
    black
    ipython
    mypy
    pytest

    pkgs.pyright
  ];
}
