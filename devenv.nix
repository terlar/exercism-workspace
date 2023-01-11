{
  imports = [./common.nix];

  scripts.exercism-workspace-init.exec = ''
    token="''${1?please provide token to use with exercism}"
    exercism configure --workspace="$PWD" --token="$token"
  '';

  pre-commit.hooks.alejandra.enable = true;
  pre-commit.hooks.black.enable = true;
  pre-commit.hooks.deadnix.enable = true;
  pre-commit.hooks.elm-format.enable = true;
  pre-commit.hooks.hlint.enable = true;
  pre-commit.hooks.luacheck.enable = true;
  pre-commit.hooks.ormolu.enable = true;
  pre-commit.hooks.purty.enable = true;
  pre-commit.hooks.shellcheck.enable = true;
  pre-commit.hooks.statix.enable = true;
  pre-commit.hooks.stylua.enable = true;
}
