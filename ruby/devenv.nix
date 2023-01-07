{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    ruby --version

    echo
    echo Run the tests with:
    echo 'ruby *_test.rb'
  '';
  scripts.test-all.exec = "ruby *_test.rb";

  languages.ruby.enable = true;

  packages = [
    pkgs.rubyPackages.minitest

    pkgs.rufo
    pkgs.solargraph
  ];
}
