{
  config,
  pkgs,
  ...
}: {
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
    # Compilation
    pkgs.gcc
    pkgs.gnumake

    # Used to setup the OCAMLPATH for libs
    pkgs.ocamlPackages.findlib

    # Libs
    pkgs.ocamlPackages.base
    pkgs.ocamlPackages.core_kernel
    pkgs.ocamlPackages.ounit
    pkgs.ocamlPackages.qcheck

    # Lib deps
    pkgs.ocamlPackages.ounit2
    pkgs.ocamlPackages.seq
    pkgs.ocamlPackages.sexplib0
    pkgs.ocamlPackages.stdlib-shims

    # REPL
    pkgs.ocamlPackages.utop
  ];

  env.OCAMLPATH = "${config.env.DEVENV_PROFILE}/lib/ocaml/${pkgs.ocamlPackages.ocaml.version}/site-lib/";
}
