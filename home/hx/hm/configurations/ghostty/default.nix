{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    systemd = {
      enable = true;
    };
    installVimSyntax = true;
    installBatSyntax = true;
    enableZshIntegration = true;
    clearDefaultKeybinds = true;

    settings = {
      shell-integration-features = "ssh-env,ssh-terminfo";
      keybind = [
        "alt+b=toggle_tab_overview"
        "ctrl+t=new_tab"
        "ctrl+shift+w=close_tab"
        "ctrl+n=toggle_quick_terminal"
        "ctrl+tab=next_tab"
        "ctrl++=increase_font_size:1"
        "ctrl+-=decrease_font_size:1"
        "ctrl+0=reset_font_size"
      ];
      clipboard-read = "allow";
      clipboard-write = "allow";
      copy-on-select = true;
      window-save-state = "always";
      window-theme = "dark";
      theme = "iTerm2 Smoooooth";
      cursor-style = "block";
      font-size = 12;
      focus-follows-mouse = true;
      gtk-titlebar = false;
      macos-titlebar-style = "hidden";
      macos-window-shadow = false;
    };
  };
}
