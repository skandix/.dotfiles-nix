{ pkgs, configs, ... }:

{
  home-manager.users.hx = {
    programs.rofi = {
      enable = true;
      theme = "spotlight";
      font = "Hack 8";
      terminal = "ghostty";
      xoffset = 0;
      yoffset = -100;

      modes = [
        "drun"
        "emoji"
        "ssh"
        "games"
        "calc"
      ];

      plugins = with pkgs; [
        rofi-calc
        rofi-emoji
        rofi-games
        rofi-power-menu
      ];

      extraConfig = {
        show-icons = true;
        terminal = "ghostty";
        ssh-client = "ssh";
        ssh-command = "{terminal} -e ssh {host}";
        run-command = "{cmd}";
      };
    };

    xdg.configFile = {
      "rofi/spotlight.rasi".source = ./spotlight.rasi;
    };

  };
}
