{ pythonVersion ? "38"
, pkgs ? (import ../. {}).pkgs
, python ? pkgs."python${pythonVersion}"
, pythonPackages ? pkgs."python${pythonVersion}Packages"
}:

pkgs.mkShell {
  buildInputs = [
    python

    pythonPackages.black
    pythonPackages.ipython
    pythonPackages.mypy
    pythonPackages.pytest

    pythonPackages.pyls-mypy
    pythonPackages.python-language-server
    pythonPackages.rope
  ];
}
