{
  description = "Cornflakes, probably have not heard this before huehuehue";

  # nixConfig = {
  #   substituters = [
  #     # Query the mirror of USTC first, and then the official cache.
  #     "https://mirrors.ustc.edu.cn/nix-channels/store"
  #     "https://cache.nixos.org"
  #   ];
  # };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-gaming.url = "github:fufexan/nix-gaming";
  };


  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nur, nixos-hardware, home-manager, nix-gaming, darwin, ...}:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in {
      nixosConfigurations = {
        DeathStar = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/DeathStar/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
        TheOrville = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/TheOrville/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
        SpaceCruiser = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/SpaceCruiser/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };

    #darwinConfigurations."SpaceCruiser" = darwin.lib.darwinSystem {
      #modules = [
        #./modules/macos/nix-core.nix
        #./modules/macos/system.nix
        #./modules/macos/apps.nix
        #./modules/macos/system.nix
      #];
    #};
}
