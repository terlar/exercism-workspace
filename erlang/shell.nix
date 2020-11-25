{ erlangVersion ? "R22"
, pkgs ? (import ../. {}).pkgs
, erlang ? pkgs."erlang${erlangVersion}"
, beamPackages ? pkgs.beam.packages."erlang${erlangVersion}"
}:

pkgs.mkShell {
  buildInputs = [
    erlang
    beamPackages.rebar3
  ];
}
