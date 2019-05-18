with (import <nixpkgs> {});

let
  nodejs = nodejs-10_x;
in mkShell {
  buildInputs = [
    nodePackages.eslint_d
    nodePackages.indium
    nodePackages.javascript-typescript-langserver
    nodePackages.prettier
    nodePackages.typescript
    nodePackages.yarn
    nodejs
  ];
}
