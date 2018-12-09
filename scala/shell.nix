with (import <nixpkgs> {});

let
  scala = scala_2_12;
in mkShell {
  buildInputs = [
    coursier
    sbt
    scala
    scalafmt
  ];
}
