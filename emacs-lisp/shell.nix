{ pkgs ? (import ../. {}).pkgs }:

let
  ertRun = pkgs.writeShellScriptBin "ert-run" ''
    ${pkgs.emacs}/bin/emacs -batch -l ert -l $1 -f ert-run-tests-batch-and-exit
  '';
in pkgs.mkShell {
  buildInputs = with pkgs; [
    ertRun
    emacs
  ];
}
