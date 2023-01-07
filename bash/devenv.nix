{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    bash --version | head -1
    bats --version

    echo
    echo Run the tests with:
    echo 'bats *_test.sh'
  '';
  scripts.test-all.exec = "bats *_test.sh";

  packages = [pkgs.bats];
}
