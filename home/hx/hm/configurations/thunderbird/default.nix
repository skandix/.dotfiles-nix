
{ pkgs, configs, unstable, ... }:

{
  home-manager.users.hx = {
      programs.thunderbird = {
          enable = true;
          package = unstable.thunderbird;
          settings = {
              "privacy.donottrackheader.enabled" = true;
          };
          profiles.hx = {
              name = "hx";
              isDefault = true;
              search.default = "google";
          };
      };
  };
}
