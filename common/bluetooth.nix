{config, pkgs, ...}:

{
  services.blueman.enable = true;
  hardware = {
    bluetooth.enable = true;
    bluetooth.settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    bluez
  ];
}
