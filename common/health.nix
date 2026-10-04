{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ smartmontools ];

  services = {
    smartd = {
      enable = true;
      autodetect = true;
      notifications = {
        wall.enable = true;
        test = true;
      };
    };
  };
}
