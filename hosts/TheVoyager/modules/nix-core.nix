{ pkgs, ... }:

{
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = pkgs.nix;
    optomise.automatic = true;
    linux-builder = {
      enable = false;
    };

    extraOptions = ''
      auto-optimise-store = true
      extra-platforms = aarch64-darwin
    '';

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optomise-store = true;
      max-jobs = "auto";
      builders-use-substitutes = true;
      };
    gc.automatic = true;

  };
  #services.nix-daemon.enable = true; #no longer has any effect
}
