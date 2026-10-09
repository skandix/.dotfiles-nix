{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    sensibleOnTop = true;
    newSession = true;
    secureSocket = true;
    clock24 = true;
    terminal = "tmux-256color";
    keyMode = "vi";
    mouse = true;
    baseIndex = 1;
    historyLimit = 50000;
    focusEvents = true;
    aggressiveResize = true;
    plugins = with pkgs.tmuxPlugins; [
      cpu
      vim-tmux-navigator
      {
        plugin = gruvbox;
        extraConfig = "set -g @tmux-gruvbox 'dark'";
      }
    ];

    extraConfig = /* bash */ ''
      set -as terminal-features ",xterm-ghostty:RGB"
      set -as terminal-features ",xterm-256color:RGB"
      set -g status-keys vi
      set -g renumber-windows on

      setw -g mode-keys vi

      # resize with prefix
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # smart pane switching with awareness of vim splits
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # vim style of copy
      set -g set-clipboard on
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send -X copy-pipe-and-cancel
    '';
  };
}
