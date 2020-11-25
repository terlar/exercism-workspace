{ pkgs ? (import ../. {}).pkgs }:

let
  testBin = pkgs.writeShellScriptBin "run-tests" ''
    ${pkgs.lispPackages.quicklisp}/bin/quicklisp run -- --load *-test.lisp --quit
  '';
in pkgs.mkShell {
  buildInputs = with pkgs; [
    testBin

    sbcl
    lispPackages.quicklisp
  ];

  shellHook = ''
    [[ -d $HOME/quicklisp ]] || ${pkgs.expect}/bin/expect -c 'spawn quicklisp init --quicklisp-dir "$env(HOME)/quicklisp"; expect "continue." {send "\r"}'
  '';
}
