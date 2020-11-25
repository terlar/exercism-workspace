{ compiler ? "ghc885"
, pkgs ? (import ../. {}).pkgs
, ghc ? pkgs.haskell.compiler.${compiler}
, ghcide ? pkgs."ghcide-${compiler}"
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    ghc
    ghcid
    ghcide
    haskellPackages.brittany
    haskellPackages.hlint
    haskellPackages.hspec
    haskellPackages.stack
  ];
}
