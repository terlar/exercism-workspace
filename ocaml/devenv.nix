{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    ocaml --version
    echo "dune $(dune --version)"

    echo
    echo Run the tests with:
    echo 'make'
  '';
  scripts.test-all.exec = "make";

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
