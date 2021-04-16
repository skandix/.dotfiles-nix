{config, pkgs, ...}:

{

  services.blueman.enable = true;
  hardware = {
    bluetooth.enable = true;
    bluetooth.config = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    bluez
  ];
}
