{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;

mkShell {
  buildInputs = [
    sbcl
    lispPackages.quicklisp
  ];

  shellHook = ''
    [[ -d $HOME/quicklisp ]] || ${expect}/bin/expect -c 'spawn quicklisp init --quicklisp-dir "$env(HOME)/quicklisp"; expect "continue." {send "\r"}'
  '';
}
