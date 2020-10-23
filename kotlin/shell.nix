{ nixpkgs ? import <nixpkgs> {}, jdkName ? "openjdk", jdkVersion ? "12" }:

with nixpkgs;

let
  jdk = pkgs."${jdkName}${jdkVersion}";
in mkShell {
  buildInputs = [
    gradle
    jdk
    kotlin
  ];
}
