{
  imports = [../common.nix];

  enterShell = ''
    rustc --version
    cargo --version

    echo
    echo Run the tests with:
    echo 'cargo test'
  '';
  scripts.test-all.exec = "cargo test -- --include-ignored";

  languages.rust.enable = true;
  languages.rust.version = "latest";
}
