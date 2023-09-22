{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    gradle --version

    echo
    echo Run the tests with:
    echo 'gradle test'
  '';
  scripts.exercism-test.exec = "gradle test";

  languages.java.enable = true;
  languages.java.gradle.enable = true;

  packages = [
    pkgs.jdt-language-server
  ];
}
