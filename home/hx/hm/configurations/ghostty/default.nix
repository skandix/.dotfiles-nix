{ pkgs, ... }:

{
  home-manager.users.hx = {
    programs.ghostty = {
      enable = true;
      systemd = {
        enable = true;
      };
      installVimSyntax = true;
      installBatSyntax = true;
      enableFishIntegration = true;
      clearDefaultKeybinds = true;

      settings = {
        keybind = [
         "alt+b=toggle_tab_overview"
          "ctrl+t=new_tab"
          "ctrl+shift+w=close_tab"
          "ctrl+n=toggle_quick_terminal"
          "ctrl+tab=next_tab"
          "ctrl+plus=increase_font_size:1"
          "ctrl+minus=decrease_font_size:1"
          "ctrl+zero=reset_font_size"
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
  };
}
