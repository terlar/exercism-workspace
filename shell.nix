with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    exercism
  ];
}
