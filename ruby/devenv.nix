{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    ruby --version

    echo
    echo Run the tests with:
    echo 'ruby *_test.rb'
  '';
  scripts.exercism-test.exec = "ruby *_test.rb";

  languages.ruby.enable = true;

  packages = [
    pkgs.rubyPackages.minitest
    pkgs.rubyPackages.pry

    pkgs.rufo
    pkgs.solargraph
  ];
}
