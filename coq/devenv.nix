{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    coqc --version

    echo
    echo Run the tests with:
    echo 'coqc x.v && coqc test.v'
  '';

  scripts.test-all.exec = ''
    ${pkgs.findutils}/bin/find -name '*.v' -not -name test.v -exec coqc {} +
    coqc test.v
  '';

  packages = [pkgs.coq];
}
