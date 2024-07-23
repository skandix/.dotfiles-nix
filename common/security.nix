{ config, lib, pkgs, ... }:

{
    boot.tmp.cleanOnBoot = true;

    nix.settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" "hx" ];
    };

    nix.gc = {
        automatic = true;
        options = "--delete-older-than 7d";
    };

    nix.optimise =  {
        automatic = true;
    };

    security.pam.loginLimits = [{
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "unlimited";
    }];
}


