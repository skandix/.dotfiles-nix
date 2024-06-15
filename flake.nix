{
  description = "Cornflakes, probably have not heard this before huehuehue";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixos-hardware, home-manager, nixpkgs, nixpkgs-unstable, ...}:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      username = "skandix";
    in {
      nixosConfigurations = {
        DeathStar = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/DeathStar/configuration.nix ];
          specialArgs = {
            inherit username;
            inherit pkgs-unstable;
          };
        };
        TheOrville = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/TheOrville/configuration.nix ];
          specialArgs = {
            inherit username;
            inherit pkgs-unstable;
          };
        };
        SpaceCruiser = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/SpaceCruiser/configuration.nix ];
          specialArgs = {
            inherit username;
            inherit pkgs-unstable;
          };
        };
      };
      homeConfigurations = {
        hx = home-manager.lib.homeManagerConfiguration { # <-- HOME MANAGER BUILDER FUNCTION FROM STABLE
          inherit pkgs; # <-- STABLE
          modules = [
            ./home/hx
            ./home/hx/gui.nix
            ./home/hx/cli.nix
            ./home/hx/i3
          ]
          ;
          extraSpecialArgs = {
            inherit username;
            inherit pkgs-unstable; # <-- UNSTABLE
          };
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
