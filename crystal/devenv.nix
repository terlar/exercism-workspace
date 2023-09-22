{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    crystal --version

    echo
    echo Run the tests with:
    echo 'crystal spec'
  '';
  scripts.exercism-test.exec = "crystal spec";

  packages = [
    pkgs.pcre
    pkgs.crystal
  ];
}
