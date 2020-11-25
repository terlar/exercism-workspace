{ nodeVersion ? "14_x"
, pkgs ? (import ../. {}).pkgs
, nodejs ? pkgs."nodejs-${nodeVersion}"
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    clojure
  ];
}
