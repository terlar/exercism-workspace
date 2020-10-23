{ nixpkgs ? import <nixpkgs> {}, jdkName ? "openjdk", jdkVersion ? "8" }:

with nixpkgs;

let
  jdk = pkgs."${jdkName}${jdkVersion}";
in mkShell {
  buildInputs = [
    clojure
    jdk
    leiningen
  ];
}
