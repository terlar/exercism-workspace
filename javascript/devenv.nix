{
  config,
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
  imports = [../common.nix];

  enterShell = ''
    echo "node $(${config.languages.javascript.package}/bin/node --version)"
    echo "npm $(${config.languages.javascript.package}/bin/npm --version)"

    echo
    echo Run the tests with:
    echo 'npm test'

    export PATH="$PATH:${nodeModules}/node_modules/.bin"
  '';
  scripts.test-all.exec = "npm test";

  languages.javascript.enable = true;

  scripts.npm.exec = ''
    if [[ ! node_modules -ef "${nodeModules}/node_modules" ]]; then
      echo Linking node_modules...
      rm -rf node_modules
      ln -s "${nodeModules}/node_modules"
    fi

    ${config.languages.javascript.package}/bin/npm "$@"
  '';
}
