{config, pkgs, ...}:

{
  #networking.firewall.allowedTCPPorts = [
    #8123
  #];
  services.home-assistant = {
    enable = true;
    openFirewall = true;
    package = (pkgs.unstable.home-assistant.override {
      extraPackages = py: with py; [ aiohttp-cors zeroconf pycrypto ];
    }).overrideAttrs (_: {
      tests = [];
      doInstallCheck = false;
    });
    config = {
      homeassistant = {
        name = "Home";
        time_zone = "Europe/Oslo";
        latitude = 1;
        longitude = 1;
        elevation = 1;
        unit_system = "metric";
        temperature_unit = "C";
      };
      # Enable the frontend
      frontend = { };
      mobile_app = { };
    };
  };
}
