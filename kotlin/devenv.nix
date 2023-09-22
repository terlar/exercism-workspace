{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    gradle --version

    echo
    echo Run the tests with:
    echo 'gradle test'
  '';
  scripts.exercism-test.exec = "gradle test";

  languages.kotlin.enable = true;

  env.JAVA_HOME = pkgs.jre.home;
}
