{
  description = "Cornflakes, probably have not heard this before huehuehue";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    # Comma
    nix-index-db.url = "github:nix-community/nix-index-database";
    nix-index-db.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Home-Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix on Macos
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix-Homebrew
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    # Nix-ld -  Run unpatched dynamic binaries on NixOS
    #nix-ld.url = "github:Mic92/nix-ld";
    #nix-ld.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-index-db,
      nixpkgs-unstable,
      nixos-hardware,
      home-manager,
      nix-darwin,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      #nix-ld,
      ...
    }:

    {
      nixosConfigurations = {
        DeathStar = nixpkgs.lib.nixosSystem {
          unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
          specialArgs = {
            inherit inputs;
            inherit nixpkgs-unstable;
          };
          modules = [
            ./hosts/DeathStar/configuration.nix
            inputs.home-manager.nixosModules.default
            nix-index-db.nixosModules.nix-index
          ];
        };

        Cerritos = nixpkgs.lib.nixosSystem {
          unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
          specialArgs = {
            inherit inputs;
            inherit nixpkgs-unstable;
          };
          modules = [
            ./hosts/Cerritos/configuration.nix
            inputs.home-manager.nixosModules.default
            nix-index-db.nixosModules.nix-index
          ];
        };

        TheOrville = nixpkgs.lib.nixosSystem {
          unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
          specialArgs = {
            inherit inputs;
            inherit nixpkgs-unstable;
          };
          modules = [
            ./hosts/TheOrville/configuration.nix
            inputs.home-manager.nixosModules.default
            nix-index-db.nixosModules.nix-index
          ];
        };

        SpaceCruiser = nixpkgs.lib.nixosSystem {
          unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
          specialArgs = {
            inherit inputs;
            inherit nixpkgs-unstable;
          };
          modules = [
            ./hosts/SpaceCruiser/configuration.nix
            inputs.home-manager.nixosModules.default
            nix-index-db.nixosModules.nix-index
          ];
        };
      };

      darwinConfigurations = {
        TheVoyager = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
          specialArgs = {
            inherit inputs;
            inherit nixpkgs-unstable;
            inherit homebrew-cask;
            inherit homebrew-core;
          };
          modules = [
            ./hosts/TheVoyager/modules/apps.nix
            ./hosts/TheVoyager/modules/host-users.nix
            ./hosts/TheVoyager/modules/nix-core.nix
            ./hosts/TheVoyager/modules/system.nix
            nix-index-db.darwinModules.nix-index
            nix-homebrew.darwinModules.nix-homebrew
          ];
        };
      };
    };
}