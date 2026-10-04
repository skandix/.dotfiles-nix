{
  description = "Cornflakes, probably have not heard this before huehuehue";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Disko - disk partition the nixos way
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Comma
    nix-index-db = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Mango
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Home-Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix-Darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix-Homebrew Darwin
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };

    # Vscode Server
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
    };

    # default browser nix-darwin
    default-browser = {
      url = "github:szympajka/nix-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Missings Fonts
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
          modules = [
            ./hosts/TheVoyager/modules/system.nix
            ./hosts/TheVoyager/modules/apps.nix
            ./hosts/TheVoyager/modules/host-users.nix
            ./hosts/TheVoyager/modules/nix-core.nix
            inputs.nix-index-db.darwinModules.nix-index
            inputs.home-manager.darwinModules.home-manager
            inputs.nix-homebrew.darwinModules.nix-homebrew
            inputs.default-browser.darwinModules.default-browser

            ({ unstable, ... }: {
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs unstable; };
              home-manager.backupFileExtension = "hm-backup";
              home-manager.users.hx.imports = [ ./hosts/TheVoyager/modules/home.nix ];
            })
          ];
        };
      };
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-tree;
      };
    };
}
