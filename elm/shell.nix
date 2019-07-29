with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    elmPackages.elm
  ];
}
