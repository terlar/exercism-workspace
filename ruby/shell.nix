{ rubyVersion ? "2_5"
, pkgs ? (import ../. {}).pkgs
, ruby ? pkgs."ruby_${rubyVersion}"
, rubyPackages ? pkgs."rubyPackages_${rubyVersion}"
, bundler ? (pkgs.bundler.override { inherit ruby; })
, rubygems ? (pkgs.rubygems.override { inherit ruby; })
, rufo ? (pkgs.callPackage ./.support/rufo { inherit ruby; })
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    ruby
    bundler
    rubyPackages.minitest

    rufo
    solargraph
  ];
}
