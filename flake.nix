{
  description = "Cornflakes, probably have not heard this before huehuehue";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nixos-hardware, home-manager, nix-darwin, ...}:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages."x86_64-linux";
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
          ];
        };
      };
      darwinConfigurations = {
        TheVoyager = nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit inputs;
            inherit unstable;
          };
          modules = [
            ./hosts/TheVoyager/modules/apps.nix
            ./hosts/TheVoyager/modules/host-users.nix
            ./hosts/TheVoyager/modules/nix-core.nix
            ./hosts/TheVoyager/modules/system.nix
          ];
        };
      };
    };
}
