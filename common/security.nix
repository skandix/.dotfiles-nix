{config, lib, pkgs, ...}:

with lib; {
  config = {
    boot.cleanTmpDir = true;

    nix = {
      autoOptimiseStore = true;
      trustedUsers = [ "root" "skandix" ];
    };

    security.pam.loginLimits = [{
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "unlimited";
    }];
  };
}
