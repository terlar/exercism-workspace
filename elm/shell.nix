{ pkgs ? (import ../. {}).pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    elmPackages.elm
    elmPackages.elm-format
    elmPackages.elm-language-server
    elmPackages.elm-test
  ];
}
