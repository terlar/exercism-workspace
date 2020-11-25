{ juliaVersion ? "15"
, pkgs ? (import ../. {}).pkgs
, julia ? pkgs."julia_${juliaVersion}"
}:

pkgs.mkShell {
  buildInputs = [ julia ];
}
