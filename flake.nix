{
  description = "Exercism Workspace";

  inputs = {
    devenv.url = "github:cachix/devenv";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";
    npm-buildpackage.url = "github:serokell/nix-npm-buildpackage";
    npm-buildpackage.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: let
    inherit (inputs.nixpkgs) lib;
    systems = ["x86_64-linux" "i686-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];
    forAllSystems = lib.genAttrs systems;
  in {
    formatter = forAllSystems (system: inputs.nixpkgs.legacyPackages.${system}.alejandra);

    devShells =
      forAllSystems
      (system:
        {
          default = inputs.devenv.lib.mkShell {
            inherit inputs;
            pkgs = inputs.nixpkgs.legacyPackages.${system};
            modules = [./devenv.nix];
          };
        }
        // (lib.pipe ./. [
          builtins.readDir
          (lib.filterAttrs (n: v:
            (v == "directory")
            && builtins.pathExists (./. + "/${n}/devenv.nix")))
          (builtins.mapAttrs (n: _:
            inputs.devenv.lib.mkShell {
              inherit inputs;
              pkgs = inputs.nixpkgs.legacyPackages.${system};
              modules = [(./. + "/${n}/devenv.nix")];
            }))
        ]));
  };
}
