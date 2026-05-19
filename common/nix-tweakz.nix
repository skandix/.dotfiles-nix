{
  config,
  lib,
  pkgs,
  ...
}:

{
  boot.tmp = {
    useTmpfs = true;
    cleanOnBoot = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = [
        "root"
        "hx"
      ];
      extra-substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = true;
    };
  };
  security.pam = {
    krb5 = {
      enable = true;
    };
    loginLimits = [
      {
        domain = "*";
        type = "soft";
        item = "nofile";
        value = "unlimited";
      }
    ];
  };
}
