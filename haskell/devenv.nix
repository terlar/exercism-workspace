{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    echo "stack $(stack --version)"

    echo
    echo Run the tests with:
    echo 'stack test'
  '';
  scripts.test-all.exec = "stack test";

  languages.haskell.enable = true;

  packages = [
    pkgs.haskellPackages.hlint
    pkgs.haskellPackages.ormolu
  ];
}
