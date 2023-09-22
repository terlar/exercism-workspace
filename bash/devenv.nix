{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    bash --version | head -1
    bats --version

    echo
    echo Run the tests with:
    echo 'bats *.bats'
  '';

  scripts.exercism-test.exec = ''
    export BATS_RUN_SKIPPED=true
    ${pkgs.findutils}/bin/find \( -name '*.bats' -or -name '*_test.sh' \) -exec bats {} +
  '';

  packages = [pkgs.bats];
}
