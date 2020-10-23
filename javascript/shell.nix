{ nodeVersion ? "10_x"
, nixpkgs ? import <nixpkgs> {}
, nix-npm-buildpackage ? nixpkgs.callPackage (builtins.fetchTarball {
  url = "https://github.com/serokell/nix-npm-buildpackage/tarball/abde678d1584af0ad00477486bca26c880963a70";
  sha256 = "0xvwk67j1aaswrk3mapfrfhfv6r1dmcrrm83fjjfy6ak8h6dk4ba";
}) {}
}:

with nixpkgs;

let
  nodejs = pkgs."nodejs-${nodeVersion}";
  nodePackages = pkgs."nodePackages_${nodeVersion}";

  nodeEnv = nix-npm-buildpackage.buildNpmPackage {
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
