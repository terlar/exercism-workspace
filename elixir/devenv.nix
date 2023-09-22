{
  imports = [../common.nix];

  enterShell = ''
    elixir --version

    echo
    echo Run the tests with:
    echo 'mix test'
  '';
  scripts.exercism-test.exec = "mix test";

  languages.elixir.enable = true;
}
