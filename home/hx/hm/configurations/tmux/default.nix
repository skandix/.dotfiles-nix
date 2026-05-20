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
          plugin = tmuxPlugins.catppuccin;
        }
      ];
      extraConfig = ''
        set -sg escape-time 0
        set -g status-keys vi
        setw -g mode-keys vi

        # smart pane switching with awareness of vim splits
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
      '';
    };
  };
}
