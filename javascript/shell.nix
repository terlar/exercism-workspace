{ nodeVersion ? "10_x"
, nixpkgs ? (import ../. {}).pkgs
}:

with nixpkgs;

let
  nodejs = pkgs."nodejs-${nodeVersion}";

  nodeEnv = buildNpmPackage {
    src = ./.support/env;
  };

  testBin = writeShellScriptBin "jest" ''
    ln -fs ${nodeEnv}/node_modules
    exec ${nodeEnv}/node_modules/.bin/jest "$@"
  '';

  lintBin = writeShellScriptBin "lint" ''
    ln -fs ${nodeEnv}/node_modules
    exec ${nodeEnv}/node_modules/.bin/eslint . --ext .jsx,.js
  '';
in mkShell {
  buildInputs = [
    testBin
    lintBin

    nodejs
    nodePackages.eslint_d
    nodePackages.indium
    nodePackages.javascript-typescript-langserver
    nodePackages.prettier
  ];

  shellHook = ''
    export PATH="${nodeEnv}/bin:$PATH"
  '';
}
