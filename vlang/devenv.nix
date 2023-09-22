{
  imports = [../common.nix];

  enterShell = ''
    v --version

    echo
    echo Run the tests with:
    echo 'v test .'
  '';
  scripts.exercism-test.exec = "v test .";

  languages.v.enable = true;
}
