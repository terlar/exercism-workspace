{
  description = "Exercism Workspace";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";
    nix-npm-buildpackage.url = "github:serokell/nix-npm-buildpackage";
  };

  outputs = { self, nixpkgs, nix-npm-buildpackage }:
    let
      pkgsFor = system:
        import nixpkgs {
          inherit system;
          overlays = [ self.overlay ];
        };
    in {
      overlay = final: prev:
        with prev.lib;
        let
          overlays = [
            nix-npm-buildpackage.overlay
            (final: prev: { nodejs = prev.nodejs-12_x; })
          ];
        in foldl' (flip extends) (_: prev) overlays final;

      packages.x86_64-linux = let pkgs = pkgsFor "x86_64-linux";
      in { inherit (pkgs) nodejs; };

      devShell.x86_64-linux = let
        pkgs = pkgsFor "x86_64-linux";
        setupBin = pkgs.writeShellScriptBin "setup-exercism" ''
          exercism configure --workspace=$PWD --token=''${1?please provide token to use with exercism}
        '';
      in pkgs.mkShell {
        nativeBuildInputs = [
          setupBin

          pkgs.exercism
          pkgs.nixfmt
        ];
      };
    };
}
