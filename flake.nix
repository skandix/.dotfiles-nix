{
  description = "Cornflakes, probably have not heard this before huehuehue";

  inputs = {
    # Nixpkgs
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-25.05"; };
    nixpkgs-unstable = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    nixos-hardware = { url = "github:NixOS/nixos-hardware"; };

    # Comma
    nix-index-db = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Home-Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix-Darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix-Homebrew Darwin
    nix-homebrew = { url = "github:zhaofengli/nix-homebrew"; };
  };

  outputs = inputs@{ self, nixpkgs, nix-index-db, nixpkgs-unstable
    , nixos-hardware, home-manager, nix-darwin, nix-homebrew, ... }:

    let
      system = "x86_64-linux";
      unstable = nixpkgs-unstable.legacyPackages.${system};
    in {
      nixosConfigurations = {
        DeathStar = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit unstable;
          };
          modules = [
            ./hosts/DeathStar/configuration.nix
            inputs.home-manager.nixosModules.default
            nix-index-db.nixosModules.nix-index
          ];
        };

        Cerritos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit unstable;
          };
          modules = [
            ./hosts/Cerritos/configuration.nix
            inputs.home-manager.nixosModules.default
            nix-index-db.nixosModules.nix-index
          ];
        };

        TheOrville = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit unstable;
          };
          modules = [
            ./hosts/TheOrville/configuration.nix
            inputs.home-manager.nixosModules.default
            nix-index-db.nixosModules.nix-index
          ];
        };

        SpaceCruiser = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit unstable;
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
            inherit unstable;
          };
          modules = [
            ./hosts/TheVoyager/modules/system.nix
            ./hosts/TheVoyager/modules/apps.nix
            ./hosts/TheVoyager/modules/host-users.nix
            ./hosts/TheVoyager/modules/nix-core.nix
            nix-index-db.darwinModules.nix-index
            home-manager.darwinModules.home-manager
            nix-homebrew.darwinModules.nix-homebrew
            {
              #home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.skandix =
                import ./hosts/TheVoyager/modules/home.nix;
            }
          ];
        };
      };
    };
}
