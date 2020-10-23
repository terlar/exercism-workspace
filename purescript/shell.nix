{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;

mkShell {
  buildInputs = [
    purescript
    pulp
    nodePackages.bower
  ];
}
