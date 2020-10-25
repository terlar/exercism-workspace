{ nixpkgs ? (import ../. {}).pkgs }:

with nixpkgs;

mkShell {
  buildInputs = [
    bats
  ];
}
