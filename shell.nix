with (import <nixpkgs> {});

let
  setupBin = writeShellScriptBin "setup-exercism" ''
    exercism configure --workspace=$PWD --token=''${1?please provide token to use with exercism}
  '';
in mkShell {
  buildInputs = [
    exercism
    setupBin
  ];
}
