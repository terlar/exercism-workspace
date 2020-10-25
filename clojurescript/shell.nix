{ nodeVersion ? "12_x"
, nixpkgs ? (import ../. {}).pkgs
}:

with nixpkgs;

let
  nodejs = pkgs."nodejs-${nodeVersion}";
in mkShell {
  buildInputs = [
    nodejs
    clojure
  ];
}
