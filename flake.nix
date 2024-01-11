{
  description = "Cornflakes, probably have not heard this before huehuehue";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming.url = "github:fufexan/nix-gaming";
    ssh-keys = {
      url = "https://github.com/skandix.keys";
      flake = false;
    };
  };

    outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-unstable,
    nur,
    nixos-hardware,
    home-manager,
    nix-gaming
    }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";

    nixosConfigurations = {
      DeathStar = mkMachine [
        ./machines/DeathStar/configuration.nix
        # nixos-hardware.nixosModules...
      ];
      SpaceCruiser = mkMachine [
        ./machines/SpaceCruiser/configuration.nix
        # nixos-hardware.nixosModules...
      ];
      TheOrville = mkMachine [
        ./machines/TheOrville/configuration.nix
        # nixos-hardware.nixosModules...
      ];
    };
  };
}