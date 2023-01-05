{pkgs, ...}: {
  languages.ruby.enable = true;

  packages = [
    pkgs.rubyPackages.minitest

    pkgs.rufo
    pkgs.solargraph
  ];
}
