with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    gradle
    openjdk
  ];
}
