{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;

mkShell {
  buildInputs = [
    polyml
  ];
}