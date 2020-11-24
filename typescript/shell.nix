{ nodeVersion ? "14_x"
, nixpkgs ? (import ../. {}).pkgs
}:

with nixpkgs;

let
  nodejs = pkgs."nodejs-${nodeVersion}";

  nodeEnv = buildYarnPackage {
    src = ./.support/env;
  };

  yarnWrapper = writeShellScriptBin "yarn" ''
    [ -f node_modules ] || ln -fs ${nodeEnv}/node_modules

    main() {
      case "$*" in
        ""|install*)
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
        lint:types*)
          shift
          exec ${nodeEnv}/node_modules/.bin/tsc --noEmit -p . "$@"
        ;;
        lint:ci*)
          shift
          exec ${nodeEnv}/node_modules/.bin/eslint_d . --ext .tsx,.ts "$@"
        ;;
        lint)
          ${nodeEnv}/node_modules/.bin/tsc --noEmit -p .
          exec ${nodeEnv}/node_modules/.bin/eslint_d . --ext .tsx,.ts
        ;;
        *)
          exec ${nodePackages.yarn}/bin/yarn "$@"
        ;;
      esac
    }

    main "$@"
  '';
in mkShell {
  buildInputs = [
    yarnWrapper

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
