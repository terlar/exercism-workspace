{ nixpkgs ? import <nixpkgs> {}, rubyVersion ? "2_5" }:

with nixpkgs;

let
  ruby = pkgs."ruby_${rubyVersion}";
  rubyPackages = pkgs."rubyPackages_${rubyVersion}";

  bundler = pkgs.bundler.override { inherit ruby; };
  rubygems = pkgs.rubygems.override { inherit ruby; };
  rufo = pkgs.callPackage ./.support/rufo { inherit ruby; };
in mkShell {
  buildInputs = [
    ruby
    bundler
    rubyPackages.minitest

    rufo
    solargraph
  ];
}
