{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;

let
  gore = callPackage ./.support/overlays/packages/gore { };
in mkShell {
  buildInputs = [
    go
    gore
  ];
}
