with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    leiningen
    openjdk
  ];
}
