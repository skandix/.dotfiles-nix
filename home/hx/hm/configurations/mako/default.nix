{ pkgs, ... }:

{
  home-manager.users.hx = {
    services.mako = {
      enable = true;
      settings = {
        "actionable=true" = {
          anchor = "top-right";
        };

        actions = true;
        anchor = "top-right";
        background-color = "#000000";
        border-color = "#FFFFFF";
        border-radius = 0;
        default-timeout = 0;
        font = "monospace 10";
        height = 100;
        icons = true;
        ignore-timeout = false;
        layer = "top";
        margin = 10;
        markup = true;
        width = 300;
      };
    };
  };
}
