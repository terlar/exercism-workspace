{ nixpkgs ? import <nixpkgs> {}, erlangVersion ? "R22" }:

with nixpkgs;

let
  erlang = nixpkgs."erlang${erlangVersion}";
  beamPackages = beam.packages."erlang${erlangVersion}";
in mkShell {
  buildInputs = [
    erlang
    beamPackages.rebar3
  ];
}
