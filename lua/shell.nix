{ pkgs ? (import ../. {}).pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    lua
    luaPackages.busted
  ];

  shellHook = ''
    export LUA_PATH="$LUA_PATH;?.lua"
  '';
}
