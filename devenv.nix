{
  imports = [./common.nix];

  scripts.exercism-workspace-init.exec = ''
    token="''${1?please provide token to use with exercism}"
    exercism configure --workspace="$PWD" --token="$token"
  '';

  pre-commit.hooks = {
    alejandra.enable = true;
    black.enable = true;
    deadnix.enable = true;
    elm-format.enable = true;
    hlint.enable = true;
    luacheck.enable = true;
    ormolu.enable = true;
    purty.enable = true;
    shellcheck.enable = true;
    statix.enable = true;
    stylua.enable = true;
  };
}
