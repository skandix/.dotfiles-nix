{ inputs, unstable, ... }:

{
  imports = [
    ./modules/system.nix
    ./modules/apps.nix
    ./modules/host-users.nix
    ./modules/nix-core.nix
    ../../home/hx/cli.nix

    inputs.nix-index-db.darwinModules.nix-index
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
    inputs.default-browser.darwinModules.default-browser
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs unstable; };
    backupFileExtension = "hm-backup";

    users.hx.imports = [ ./modules/home.nix ];
  };
}
