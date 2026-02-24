{ config, pkgs, ... }:

{
  virtualisation.incus = {
    enable = true;
    package = pkgs.incus-lts;

    ui = {
      enable = true;
    };

    agent = {
      enable = true;
    };
    #preseed = {  };
  };

  #environment.systemPackages = with pkgs; [
  #];
}
