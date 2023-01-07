{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    julia --version

    echo
    echo Run the tests with:
    echo 'julia runtests.jl'
  '';
  scripts.test-all.exec = "julia runtests.jl";

  packages = [pkgs.julia];
}
