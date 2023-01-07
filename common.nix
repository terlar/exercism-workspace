{pkgs, ...}: {
  packages = [
    pkgs.exercism
    pkgs.git
  ];

  enterShell = ''
    exercism version
  '';

  languages.nix.enable = true;
}
