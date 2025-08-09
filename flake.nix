{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , devshell
    , treefmt-nix
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
        programs.nixpkgs-fmt.enable = true;
      };
    in
    {
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
