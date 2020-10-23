{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;

mkShell {
  buildInputs = [
    lua
    luaPackages.busted
  ];

  shellHook = ''
    export LUA_PATH="$LUA_PATH;?.lua"
  '';
}
