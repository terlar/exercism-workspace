{ nixpkgs ? import <nixpkgs> {}, coqVersion ? "8_9" }:

with nixpkgs;

let
  coq = pkgs."coq_${coqVersion}";
  coqPackages = pkgs."coqPackages_${coqVersion}";
in mkShell {
  buildInputs = [
    coq
  ];
}
