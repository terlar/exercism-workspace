{
  imports = [../common.nix];

  enterShell = ''
    v --version

    echo
    echo Run the tests with:
    echo 'v test .'
  '';
  scripts.test-all.exec = "v test .";

  languages.v.enable = true;
}
