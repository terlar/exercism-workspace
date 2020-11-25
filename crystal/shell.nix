{ crystalVersion ? "0_35"
, pkgs ? (import ../. {}).pkgs
, crystal ? pkgs."crystal_${crystalVersion}"
}:

pkgs.mkShell {
  buildInputs = [ crystal ];
}
