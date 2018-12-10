with (import <nixpkgs> {});

let
  nodejs = nodejs-10_x;
in mkShell {
  buildInputs = [
    nodejs
  ];
}
