{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;

mkShell {
  buildInputs = [
    ocaml
    dune

    # Used to setup the OCAMLPATH for libs
    ocamlPackages.findlib

    # Libs
    ocamlPackages.base
    ocamlPackages.core_kernel
    ocamlPackages.ounit
    ocamlPackages.qcheck

    # REPL
    ocamlPackages.utop
  ];
}
