{
  description = "Cornflakes, probably have not heard this before huehuehue";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nix-gaming.url = "github:fufexan/nix-gaming";
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
        SpaceCruiser = nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit inputs;
            inherit unstable;
          };
          modules = [
            ./hosts/SpaceCruiser/modules/apps.nix
            ./hosts/SpaceCruiser/modules/host-users.nix
            ./hosts/SpaceCruiser/modules/nix-core.nix
            ./hosts/SpaceCruiser/modules/system.nix

#            inputs.home-manager.darwinModules.home-manager
            #{
              #home-manager.useGlobalPkgs = true;
              #home-manager.useUserPackages = true;
              #home-manager.users.hx = import ./hosts/SpaceCruiser/home.nix;
            #}
         ];
        };
      };
    };
}
