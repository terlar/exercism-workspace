{ nixpkgs ? import <nixpkgs> {}, crystalVersion ? "0_32" }:

with nixpkgs;

let
  crystal = pkgs."crystal_${crystalVersion}";
in mkShell {
  buildInputs = [
    crystal
  ];
}
