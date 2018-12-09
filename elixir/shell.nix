with (import <nixpkgs> {});

let
  elixir = beam.packages.erlangR21.elixir_1_7;
in mkShell {
  buildInputs = [
    elixir
  ];
}
