{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    # red --version

    echo
    echo Run the tests with:
    echo 'red *-test.red'
  '';
  scripts.exercism-test.exec = "red *-test.red";

  packages = [
    pkgs.red
  ];
}
