{
  imports = [../common.nix];

  enterShell = ''
    nim --version

    echo
    echo Run the tests with:
    echo 'nim c -r test_*.nim'
  '';
  scripts.exercism-test.exec = "nim c -r test_*.nim";

  languages.nim.enable = true;
}
