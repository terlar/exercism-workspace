{pkgs, ...}: {
  languages.ocaml.enable = true;

  packages = [
    # Used to setup the OCAMLPATH for libs
    pkgs.ocamlPackages.findlib

    # Libs
    pkgs.ocamlPackages.base
    pkgs.ocamlPackages.core_kernel
    pkgs.ocamlPackages.ounit
    pkgs.ocamlPackages.qcheck

    # REPL
    pkgs.ocamlPackages.utop
  ];
}
