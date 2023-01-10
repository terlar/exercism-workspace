{
  imports = [../common.nix];

  enterShell = ''
    ucm --version
  '';

  languages.unison.enable = true;
}
