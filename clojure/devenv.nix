{
  imports = [../common.nix];

  enterShell = ''
    clojure --version

    echo
    echo Run the tests with:
    echo 'clj -X:test'
  '';
  scripts.test-all.exec = "clj -X:test";

  languages.clojure.enable = true;
}
