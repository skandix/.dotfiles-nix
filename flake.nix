{
  description = "Cornflakes, probably have not heard this before huehuehue";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    #nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # home-manager-unstable = {
    #   url = "github:nix-community/home-manager/master";
    #   inputs.nixpkgs.follows = "nixpkgs-unstable";
    # };
    # darwin = {
    #   url = "github:LnL7/nix-darwin";
    #   inputs.nixpkgs.follows = "nixpkgs-unstable";
    # };
    nix-gaming.url = "github:fufexan/nix-gaming";
  };


  outputs = inputs@{ self, nixpkgs, nur, nixos-hardware, home-manager, nix-gaming }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in {
      nixosConfigurations = {
        DeathStar = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./machines/DeathStar/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
        TheOrville = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./machines/TheOrville/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
        SpaceCruiser = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./machines/SpaceCruiser/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
