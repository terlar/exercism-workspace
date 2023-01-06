{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bash/devenv.nix
    ./clojure/devenv.nix
    ./clojurescript/devenv.nix
    ./common-lisp/devenv.nix
    ./coq/devenv.nix
    ./crystal/devenv.nix
    ./elixir/devenv.nix
    ./elm/devenv.nix
    ./emacs-lisp/devenv.nix
    ./erlang/devenv.nix
    ./go/devenv.nix
    ./haskell/devenv.nix
    ./java/devenv.nix
    ./javascript/devenv.nix
    ./julia/devenv.nix
    ./kotlin/devenv.nix
    ./lua/devenv.nix
    ./nim/devenv.nix
    ./ocaml/devenv.nix
    ./purescript/devenv.nix
    ./python/devenv.nix
    ./racket/devenv.nix
    ./ruby/devenv.nix
    ./rust/devenv.nix
    ./scala/devenv.nix
    ./sml/devenv.nix
    ./typescript/devenv.nix
  ];

  packages = [
    pkgs.exercism
    pkgs.git
  ];

  enterShell = ''
    exercism version
  '';

  scripts.exercism-workspace-init.exec = ''
    token="''${1?please provide token to use with exercism}"
    exercism configure --workspace="$PWD" --token="$token"
  '';

  scripts.npm.exec = ''
    parent_dir="''${PWD%/*}"
    type="''${parent_dir##*/}"

    case "$type" in
      javascript) javascript-init ;;
      typescript) typescript-init ;;
    esac

    ${config.languages.javascript.package}/bin/npm "$@"
  '';

  scripts.yarn.exec = ''
    parent_dir="''${PWD%/*}"
    type="''${parent_dir##*/}"

    case "$type" in
      javascript) javascript-init ;;
      typescript) typescript-init ;;
    esac

    ${pkgs.yarn}/bin/yarn "$@"
  '';

  scripts.eslint.exec = ''
    if [[ ! -f node_modules/.bin/eslint ]]; then
      echo Please install node_modules
      exit 1
    fi

    node_modules/.bin/eslint "$@"
  '';

  languages.nix.enable = true;
  pre-commit.hooks.alejandra.enable = true;
  pre-commit.hooks.deadnix.enable = true;
  pre-commit.hooks.statix.enable = true;
}
