{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      devshell,
      disko,
      treefmt-nix,
      ...
    }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          devshell.overlays.default
        ];
      };

      treefmtEval = treefmt-nix.lib.evalModule pkgs {
        projectRootFile = "flake.nix";
        programs.nixfmt.enable = true;
      };
    in
    {
      # NixOS Configuration
      nixosConfigurations = {

        # Live Installer
        live-installer = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            disko.nixosModules.disko
          ]
          ++ nixpkgs.lib.filesystem.listFilesRecursive ./modules
          ++ nixpkgs.lib.filesystem.listFilesRecursive ./hosts/live-installer;
        };
      };

      # Dev Shell
      devShells.${system}.default = pkgs.devshell.mkShell {
        name = "NixOS Configuration";

        commands = [
          {
            name = "fmt";
            help = "Format all files.";
            command = "nix fmt";
          }
          {
            name = "check";
            help = "Check the flake for errors.";
            command = "nix flake check";
          }
        ];

        packages = with pkgs; [
          nixd
          nixfmt
        ];
      };

      # Formatting
      formatter.${system} = treefmtEval.config.build.wrapper;
    };
}
