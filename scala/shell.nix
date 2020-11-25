{ scalaVersion ? "2_13"
, jdkName ? "openjdk"
, jdkVersion ? "14"
, pkgs ? (import ../. {}).pkgs
, jdk ? pkgs."${jdkName}${jdkVersion}"
, scala ? pkgs."scala_${scalaVersion}"
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    coursier
    jdk
    sbt
    scala
    scalafmt
  ];
}
