{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    poly -v

    echo
    echo Run the tests with:
    echo 'poly -q --use test.sml'
  '';
  scripts.test-all.exec = "poly -q --use test.sml";

  packages = [pkgs.polyml];
}
