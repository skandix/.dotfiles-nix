{ inputs, pkgs, unstable, ... }:

{
  imports = [
    inputs.mangowm.nixosModules.mango

    ./../hm/configurations/satty
    ./../hm/configurations/waybar
    ./../hm/configurations/rofi
    ./../hm/configurations/wpaperd
    ./../hm/configurations/librewolf
    ./../hm/configurations/ghostty
    ./../hm/configurations/mpv
    ./../hm/configurations/discord
    ./../hm/configurations/udiskie
    ./../hm/configurations/vim
    ./../hm/configurations/tmux
    ./../hm/go.nix
    ./../hm/python.nix
    ./../hm/rust.nix
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

  home-manager.users.hx = {
    xdg.configFile = {
      "mango/config.conf".source = ./config.conf;
      "mango/startup.conf".source = ./startup.conf;
      "mango/keybind.conf".source = ./keybind.conf;
      "mango/mouse.conf".source = ./mouse.conf;
      "mango/visual.conf".source = ./visual.conf;
      "mango/window.conf".source = ./window.conf;
    };
  };

  environment.variables = {
    TERMINAL = "xterm-256color"; # so stuff don't shit the bed when they see a ghost
  };

}
