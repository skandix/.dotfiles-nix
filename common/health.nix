{ pkgs, ... }:

{
  programs.coolercontrol = {
    enable = true;
  };
  services = {
    smartd = {
      enable = true;
      notifications = {
        x11.enable = true;
        wall.enable = true;
        test = true;
      };
    };
  };
}
