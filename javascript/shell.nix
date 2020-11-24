{ nodeVersion ? "14_x"
, nixpkgs ? (import ../. {}).pkgs
}:

with nixpkgs;

let
  nodejs = pkgs."nodejs-${nodeVersion}";

  nodeEnv = buildNpmPackage {
    src = ./.support/env;
  };

  npmWrapper = writeShellScriptBin "npm" ''
    [ -f node_modules ] || ln -fs ${nodeEnv}/node_modules

    main() {
      case "$*" in
        install*)
          exit 0
        ;;
        run*)
          shift
          main "$@"
        ;;
        test*)
          shift
          exec ${nodeEnv}/node_modules/.bin/jest "$@"
        ;;
        lint*)
          exec ${nodeEnv}/node_modules/.bin/eslint . --ext .jsx,.js
        ;;
        *)
          exec ${nodeEnv}/bin/npm "$@"
        ;;
      esac
    }

    main "$@"
  '';

  lintBin = writeShellScriptBin "lint" ''
    ln -fs ${nodeEnv}/node_modules
  '';
in mkShell {
  buildInputs = [
    npmWrapper

    nodejs
    nodePackages.eslint_d
    nodePackages.indium
    nodePackages.prettier
    nodePackages.typescript-language-server
  ];

  shellHook = ''
    export PATH="$PATH:${nodeEnv}/node_modules/.bin"
  '';
}
