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
    #nixpkgs.url = "github:NixOS/nixpkgs";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-gaming.url = "github:fufexan/nix-gaming";
  };


  outputs = inputs@{ self, nur, nixos-hardware, home-manager, nix-gaming, darwin, nixpkgs-unstable, ...}:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs-unstable.legacyPackages."x86_64-linux";
    in {
      nixosConfigurations = {
        DeathStar = nixpkgs-unstable.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./machines/DeathStar/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
        TheOrville = nixpkgs-unstable.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./machines/TheOrville/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
        SpaceCruiser = nixpkgs-unstable.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./machines/SpaceCruiser/configuration.nix
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
