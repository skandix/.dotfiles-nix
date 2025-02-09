{
  config,
  lib,
  pkgs,
  ...
}:

{
  boot.tmp.cleanOnBoot = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = [
        "root"
        "hx"
      ];
      extra-substituters = [
        "https://nix-community.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = true;
    };
  };
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "unlimited";
    }
  ];
}
