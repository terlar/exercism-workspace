{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    crystal --version

    echo
    echo Run the tests with:
    echo 'crystal spec'
  '';
  scripts.test-all.exec = "crystal spec";

  packages = [
    pkgs.pcre
    pkgs.crystal
  ];
}
