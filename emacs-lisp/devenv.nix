{pkgs, ...}: {
  packages = [pkgs.emacs];

  scripts.ert-run.exec = ''
    emacs -batch -l ert -l $1 -f ert-run-tests-batch-and-exit
  '';
}
