{pkgs, ...}: {
  languages.haskell.enable = true;

  packages = [
    pkgs.haskellPackages.brittany
    pkgs.haskellPackages.hlint
  ];

  pre-commit.hooks.brittany.enable = true;
  pre-commit.hooks.hlint.enable = true;
}
