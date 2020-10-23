{ nixpkgs ? import <nixpkgs> {}, jdkName ? "openjdk", jdkVersion ? "11" }:

with nixpkgs;

let
  jdk = pkgs."${jdkName}${jdkVersion}";
in mkShell {
  buildInputs = [
    jdk
    gradle
  ];
}
