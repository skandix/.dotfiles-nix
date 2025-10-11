{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    banner = "
    エリアス・エインズワーズ
    ";
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };
}
