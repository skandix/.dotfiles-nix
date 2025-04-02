{ pkgs, ... }:

{
  nixpkgs = {
    hostPlatform = "x86_64-darwin";
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = pkgs.nix;
    linux-builder = {
      enable = false;
    };

    extraOptions = ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';

    settings = {
      # enable flakes globally
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      max-jobs = "auto";
      builders-use-substitutes = true;
      };

  };
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
}
