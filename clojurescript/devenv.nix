{
  imports = [../common.nix];

  enterShell = ''
    clojure --version

    echo
    echo Run the tests with:
    echo 'clj -M:test'
  '';
  scripts.exercism-test.exec = "clj -M:test";

  languages.clojure.enable = true;
  languages.javascript.enable = true;
}
