{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    lua -v
    echo "busted $(busted --version)"

    echo
    echo Run the tests with:
    echo 'busted *_spec.lua'

    export LUA_PATH="$LUA_PATH;?.lua"
  '';
  scripts.exercism-test.exec = "busted *_spec.lua";

  languages.lua.enable = true;

  packages = [pkgs.luaPackages.busted];
}
