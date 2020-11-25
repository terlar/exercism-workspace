{ pkgs ? (import ../. {}).pkgs }:

pkgs.mkShell {
  buildInputs = [ pkgs.bats ];
}
