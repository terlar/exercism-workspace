{
  inputs,
  pkgs,
  ...
}: let
  nodeModules = inputs.npm-buildpackage.legacyPackages.${pkgs.system}.mkNodeModules {
    pname = "@exercism/typescript-node-modules";
    version = "1.0.0";
    src = ./.nix-support;
  };
in {
  languages.typescript.enable = true;

  packages = [
    pkgs.yarn
  ];

  # pre-commit.hooks.eslint.enable = true;
  # pre-commit.hooks.prettier.enable = true;

  scripts.typescript-init.exec = ''
    if [[ ! node_modules -ef "${nodeModules}/node_modules" ]]; then
      echo Linking node_modules...
      rm -rf node_modules
      ln -s "${nodeModules}/node_modules"
    fi
  '';

  scripts.eslint.exec = ''
    if [[ ! -f node_modules/.bin/eslint ]]; then
      echo Please install node_modules
      exit 1
    fi

    node_modules/.bin/eslint "$@"
  '';
}
