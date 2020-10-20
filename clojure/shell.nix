with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    clojure
    leiningen
    openjdk
  ];
}
