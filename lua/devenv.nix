{pkgs, ...}: {
  languages.lua.enable = true;

  packages = [pkgs.luaPackages.busted];

  enterShell = ''
    export LUA_PATH="$LUA_PATH;?.lua"
  '';

  pre-commit.hooks.luacheck.enable = true;
  pre-commit.hooks.stylua.enable = true;
}
