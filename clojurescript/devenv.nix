{
  imports = [../common.nix];

  enterShell = ''
    clojure --version

    echo
    echo Run the tests with:
    echo 'clj -A:test'
  '';
  scripts.test-all.exec = "clj -A:test";

  languages.clojure.enable = true;
  languages.javascript.enable = true;
}
