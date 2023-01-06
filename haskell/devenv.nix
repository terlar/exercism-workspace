{pkgs, ...}: {
  languages.haskell.enable = true;

  packages = [
    pkgs.haskellPackages.hlint
    pkgs.haskellPackages.ormolu
  ];

  pre-commit.hooks.hlint.enable = true;
  pre-commit.hooks.ormolu.enable = true;
}
