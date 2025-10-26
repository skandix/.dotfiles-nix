{ pkgs, ... }:

{
  home-manager.users.hx = {
    programs.tmux = {
      enable = true;
      package = pkgs.tmux;
      sensibleOnTop = true;
      newSession = true;
      secureSocket = true;
      clock24 = true;
      plugins  = with pkgs; [
        tmuxPlugins.cpu
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        {
          plugin = tmuxPlugins.catppuccin;
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60' # minutes
          '';
        }
      ];
    };

    xdg.configFile = {
      "tmux/tmux.conf".source = ./tmux.conf;
    };
  };
}
