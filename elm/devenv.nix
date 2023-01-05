{pkgs, ...}: {
  languages.elm.enable = true;

  packages = [
    pkgs.elmPackages.elm-test
  ];

  pre-commit.hooks.elm-format.enable = true;
}
