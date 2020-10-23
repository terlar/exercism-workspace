{ compiler ? "ghc865"
, nixpkgs ? import <nixpkgs> {}
, ghcides ? import (builtins.fetchTarball {
  url = "https://github.com/cachix/ghcide-nix/tarball/5d6c79bbb74423838be588e2ce512582400567a1";
  sha256 = "18bmvlr2iyql41al73mjxkjb2sr27mjgv2mh9z8y20fgb5rg7wxc";
}) {}
}:

with nixpkgs;

let
  ghc = haskell.compiler.${compiler};
  ghcide = ghcides."ghcide-${compiler}";
in mkShell {
  buildInputs = [
    ghc
    ghcid
    ghcide
    haskellPackages.brittany
    haskellPackages.hlint
    haskellPackages.hspec
    haskellPackages.stack
  ];
}
