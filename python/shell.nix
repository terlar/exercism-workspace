{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;

let
  python = python3;
  pythonPackages = python3Packages;
in mkShell {
  buildInputs = [
    python
    pythonPackages.black
    pythonPackages.ipython
    pythonPackages.pytest
  ];
}
