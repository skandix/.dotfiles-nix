{config, pkgs, ...}:

{
  services.home-assistant = {
    enable = true;
    package = (pkgs.home-assistant.override {
      extraPackages = py: with py; [ psycopg2 ];
    });
    config.recorder.db_url = "postgresql://@/hass";
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "hass" ];
    ensureUsers = [{
      name = "hass";
      ensurePermissions = {
        "DATABASE hass" = "ALL PRIVILEGES";
      };
    }];
  };
}
