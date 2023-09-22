{
  imports = [../common.nix];

  enterShell = ''
    scala --version

    echo
    echo Run the tests with:
    echo 'sbt test'
  '';
  scripts.exercism-test.exec = "sbt test";

  languages.scala.enable = true;
}
