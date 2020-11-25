{ pkgs ? (import ../. {}).pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    gore
  ];
}
