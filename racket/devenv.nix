{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    racket --version

    echo
    echo Run the tests with:
    echo 'raco test *-test.rkt'
  '';
  scripts.test-all.exec = "raco test *-test.rkt";

  packages = [pkgs.racket];
}
