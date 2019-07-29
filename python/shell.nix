with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    python3
    python3Packages.black
  ];
}
