{ erlangVersion ? "R22"
, elixirVersion ? "1_11"
, pkgs ? (import ../. {}).pkgs
, erlang ? pkgs.beam.packages."erlang${erlangVersion}"
, elixir ? erlang."elixir_${elixirVersion}"
}:

pkgs.mkShell {
  buildInputs = [ elixir ];
}
