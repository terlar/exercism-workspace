{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    echo "elm $(elm --version)"

    echo
    echo Run the tests with:
    echo elm-test
  '';
  scripts.test-all.exec = "elm-test";

  languages.elm.enable = true;

  packages = [
    pkgs.elmPackages.elm-test
  ];
}
