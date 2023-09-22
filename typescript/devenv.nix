{
  config,
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
  imports = [../common.nix];

  enterShell = ''
    echo "node $(${config.languages.javascript.package}/bin/node --version)"
    echo "yarn $(${pkgs.yarn}/bin/yarn --version)"

    echo
    echo Run the tests with:
    echo 'yarn test'

    export PATH="$PATH:${nodeModules}/node_modules/.bin"
  '';
  scripts.exercism-test.exec = "yarn test";

  languages.typescript.enable = true;

  scripts.yarn.exec = ''
    if [[ ! node_modules -ef "${nodeModules}/node_modules" ]]; then
      echo Linking node_modules...
      rm -rf node_modules
      ln -s "${nodeModules}/node_modules"
    fi

    ${pkgs.yarn}/bin/yarn "$@"
  '';

  packages = [
    pkgs.nodePackages.typescript-language-server
  ];
}
