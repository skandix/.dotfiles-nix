{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    # banner is set on each host
    settings = {
      #PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };
}
