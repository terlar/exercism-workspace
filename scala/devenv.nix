{
  imports = [../common.nix];

  enterShell = ''
    scala --version

    echo
    echo Run the tests with:
    echo 'sbt test'
  '';
  scripts.test-all.exec = "sbt test";

  languages.scala.enable = true;
}
