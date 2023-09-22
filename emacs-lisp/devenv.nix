{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    emacs --version | head -1

    echo
    echo Run the tests with:
    echo 'ert-run *-test.el'
  '';
  scripts.exercism-test.exec = "ert-run *-test.el";

  packages = [pkgs.emacs];

  scripts.ert-run.exec = ''
    emacs -batch -l ert -l $1 -f ert-run-tests-batch-and-exit
  '';
}
