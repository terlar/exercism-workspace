{ nixpkgs ? import <nixpkgs> {}, erlangVersion ? "R22", elixirVersion ? "1_10" }:

with nixpkgs;

let
  erlang = beam.packages."erlang${erlangVersion}";
  elixir = erlang."elixir_${elixirVersion}";
in mkShell {
  buildInputs = [
    elixir
  ];
}
