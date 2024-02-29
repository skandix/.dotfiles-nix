{
  description = "Cornflakes, probably have not heard this before huehuehue";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager.url =  "github:nix-community/home-manager";
    nix-gaming.url = "github:fufexan/nix-gaming";
    # ssh-keys = {
    #   url = "https://github.com/skandix.keys";
    #   flake = false;
    # };
  };

    outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-unstable,
    nur,
    nixos-hardware,
    home-manager,
    nix-gaming
    }:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
    nixosConfigurations = {
      DeathStar = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./machines/tar/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      TheOrville = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./machines/TheOrville/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      SpaceCruiser = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./machines/SpaceCruiser/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}