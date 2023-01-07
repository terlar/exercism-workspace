{
  imports = [../common.nix];

  enterShell = ''
    echo "purs $(purs --version)"
    echo "node $(node --version)"
    echo "spago $(spago --version)"

    echo
    echo Run the tests with:
    echo 'spago test'
  '';
  scripts.test-all.exec = "spago test";

  languages.javascript.enable = true;
  languages.purescript.enable = true;
}
