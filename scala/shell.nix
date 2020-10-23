{ scalaVersion ? "2_13"
, jdkName ? "openjdk"
, jdkVersion ? "12"
, nixpkgs ? import <nixpkgs> {}
}:

with nixpkgs;

let
  jdk = pkgs."${jdkName}${jdkVersion}";
  scala = pkgs."scala_${scalaVersion}";
in mkShell {
  buildInputs = [
    coursier
    jdk
    sbt
    scala
    scalafmt
  ];
}
