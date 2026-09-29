{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ smartmontools ];

  programs.coolercontrol = {
    enable = true;
  };

  services = {
    smartd = {
      enable = true;
      autodetect = true;
      notifications = {
        x11.enable = true;
        wall.enable = true;
        test = true;
      };
    };
  };
}
