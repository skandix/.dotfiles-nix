{
  description = "Cornflakes, probably have not heard this before huehuehue";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-db = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    mangowm = {
      url = "github:mangowm/mango/0.17.5";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };

    default-browser = {
      url = "github:szympajka/nix-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-fonts = {
      url = "github:Takamatsu-Naoki/nixos-fonts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      ...
    }:

    let
      mkUnstable =
        system:
        import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };

      unstable_ = mkUnstable "x86_64-linux";

      commonModules = [
        inputs.home-manager.nixosModules.default
        inputs.nix-index-db.nixosModules.nix-index
        inputs.vscode-server.nixosModules.default
      ];

      mkHost =
        name: extraModules:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            unstable = unstable_;
          };
          modules =
            commonModules
            ++ extraModules
            ++ [
              ./hosts/${name}/configuration.nix
            ];
        };

    in
    {
      nixosConfigurations = {
        Ainsworth = mkHost "Ainsworth" [ ];
        Lynx = mkHost "Lynx" [ inputs.disko.nixosModules.disko ];
        MillenniumFalcon = mkHost "MillenniumFalcon" [ ];
        DeathStar = mkHost "DeathStar" [ ];
        TheOrville = mkHost "TheOrville" [ ];
        # Cerritos       = mkHost "Cerritos" [  ];

      };

      ### MACOS ###
      darwinConfigurations = {
        TheVoyager = inputs.nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit inputs;
            unstable = mkUnstable "aarch64-darwin";
          };
          modules = [ ./hosts/TheVoyager/configuration.nix ];
        };
      };
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-tree;
      };
    };
}
