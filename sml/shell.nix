{ pkgs ? (import ../. {}).pkgs}:

pkgs.mkShell {
  buildInputs = [ pkgs.polyml ];
}
