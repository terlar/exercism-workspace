{ pkgs ? (import ../. {}).pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    purescript
    pulp
    nodePackages.bower
  ];
}
