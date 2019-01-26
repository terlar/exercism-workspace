with (import <nixpkgs> {});

let
  ghcEnv = haskellPackages.ghcWithPackages(pkgs: with pkgs; [
    (haskellPackages.callPackage ./default.nix {})
    Cabal_2_4_1_0
  ]);
  hie =
    import (
      pkgs.fetchFromGitHub {
        owner = "domenkozar";
        repo = "hie-nix";
        rev = "19f47e0bf2e2f1a793bf87d64bf8266062f422b1";
        sha256 = "1px146agwmsi0nznc1zd9zmhgjczz6zlb5yf21sp4mixzzbjsasq";
        # date = 2019-01-02T17:40:22+00:00;
      }
    ) {};
in mkShell {
  buildInputs = [
    ghcEnv
    cabal-install
    # Editor tools
    haskellPackages.hlint
    haskellPackages.hoogle
    haskellPackages.structured-haskell-mode
    haskellPackages.stylish-haskell
    hie.hie84
  ];
}
