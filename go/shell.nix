with (import <nixpkgs> {});

let
  callPackage = pkgs.lib.callPackageWith (pkgs // self);
  gore = callPackage ./overlays/packages/gore { };
in mkShell {
  buildInputs = [
    go
    gore
  ];
}
