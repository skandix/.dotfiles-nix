{ pkgs, ... }:

{
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  nix = {
    package = pkgs.nix;
    linux-builder.enable = false;
    optimise.automatic = true;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      max-jobs = "auto";
      builders-use-substitutes = true;
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };

  };
}
