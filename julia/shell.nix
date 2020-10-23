{ nixpkgs ? import <nixpkgs> {}, juliaVersion ? "11" }:

with nixpkgs;

let
  julia = pkgs."julia_${juliaVersion}";
in mkShell {
  buildInputs = [
    julia
  ];
}
