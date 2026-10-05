{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.mangowm.nixosModules.mango
  ];

  home-manager.users.hx = {
    imports = [
      ../../modules/waybar
      ../../modules/flameshot
      ../../modules/rofi
      ../../modules/wpaperd
      ../../modules/swaylock
      ../../modules/udiskie
      ../../modules/mako
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

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
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
