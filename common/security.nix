{ config, lib, pkgs, ... }:

with lib; {
  config = {
    boot.tmp.cleanOnBoot = true;

    nix.settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" "hx" ];
    };

    security.pam.loginLimits = [{
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "unlimited";
    }];
  };
    programs = {
      ssh = {
        startAgent = true;
        agentTimeout = "4h";
      };
    gnupg.agent = { enableSSHSupport = true; };
  };
}
