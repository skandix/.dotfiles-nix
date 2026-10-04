{
  inputs,
  pkgs,
  unstable,
  ...
}:

{
  imports = [
    inputs.mangowm.nixosModules.mango
  ];

  home-manager.users.hx = {
    imports = [
      ./../hm/configurations/waybar
      ./../hm/configurations/flameshot
      ./../hm/configurations/rofi
      ./../hm/configurations/wpaperd
      ./../hm/configurations/swaylock
      ./../hm/configurations/udiskie
      ./../hm/configurations/mako
    ];

    xdg.configFile = {
      "mango/config.conf".source = ./config.conf;
      "mango/startup.conf".source = ./startup.conf;
      "mango/keybind.conf".source = ./keybind.conf;
      "mango/mouse.conf".source = ./mouse.conf;
      "mango/visual.conf".source = ./visual.conf;
      "mango/window.conf".source = ./window.conf;
    };
  };
  security.pam.services.swaylock = { };

  environment.systemPackages = with pkgs; [
    wdisplays
    waylock
    wlr-randr
  ];

  programs.mango = {
    enable = true;
  };

  services = {
    dbus = {
      enable = true;
    };

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --cmd 'dbus-run-session mango'";
          user = "greeter";
        };
      };
    };

  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

}
