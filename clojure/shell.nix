{ jdkName ? "openjdk"
, jdkVersion ? "14"
, pkgs ? (import ../. {}).pkgs
, jdk ? pkgs."${jdkName}${jdkVersion}"
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    clojure
    jdk
    leiningen
  ];
}
