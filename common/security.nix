{config, lib, pkgs, ...}:

with lib; {
  config = {
    boot.cleanTmpDir = true;

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
}
