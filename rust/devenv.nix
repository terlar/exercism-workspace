{
  imports = [../common.nix];

  enterShell = ''
    rustc --version
    cargo --version

    echo
    echo Run the tests with:
    echo 'cargo test'
  '';
  scripts.exercism-test.exec = "cargo test -- --include-ignored";

  languages.rust = {
    enable = true;
    channel = "stable";
  };
}
