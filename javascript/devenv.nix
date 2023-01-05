{
  inputs,
  pkgs,
  ...
}: let
  nodeModules = inputs.npm-buildpackage.legacyPackages.${pkgs.system}.mkNodeModules {
    pname = "@exercism/javascript-node-modules";
    version = "1.0.0";
    src = ./.nix-support;
  };
in {
  languages.javascript.enable = true;

  # pre-commit.hooks.eslint.enable = true;
  # pre-commit.hooks.prettier.enable = true;

  scripts.javascript-init.exec = ''
    if [[ ! node_modules -ef "${nodeModules}/node_modules" ]]; then
      echo Linking node_modules...
      rm -rf node_modules
      ln -s "${nodeModules}/node_modules"
    fi
  '';
}
