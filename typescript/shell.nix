{ nodeVersion ? "14_x"
, pkgs ? (import ../. { }).pkgs
, nodejs ? pkgs."nodejs-${nodeVersion}"
}:

let
  nodeEnv = pkgs.buildYarnPackage {
    src = ./.support/env;
  };

  yarnWrapper = pkgs.writeShellScriptBin "yarn" ''
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
          ${nodeEnv}/node_modules/.bin/tsc --noEmit -p .
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
          exec ${pkgs.nodePackages.yarn}/bin/yarn "$@"
        ;;
      esac
    }

    main "$@"
  '';
in
pkgs.mkShell {
  buildInputs = with pkgs; [
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
