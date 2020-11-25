{ coqVersion ? "8_9"
, pkgs ? (import ../. {}).pkgs
, coq ? pkgs."coq_${coqVersion}"
, coqPackages ? pkgs."coqPackages_${coqVersion}"
}:

pkgs.mkShell {
  buildInputs = [ coq ];
}
