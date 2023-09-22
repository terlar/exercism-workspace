{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    echo "elm $(elm --version)"

    echo
    echo Run the tests with:
    echo elm-test
  '';
  scripts.exercism-test.exec = "elm-test";

  languages.elm.enable = true;

  packages = [
    pkgs.elmPackages.elm-test
  ];
}
