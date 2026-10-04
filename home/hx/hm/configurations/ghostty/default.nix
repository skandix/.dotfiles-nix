{ pkgs, lib, ... }:

let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
in
{
  programs.ghostty = {
    enable = true;
    package = lib.mkIf isDarwin null;
    systemd.enable = !isDarwin;
    installVimSyntax = !isDarwin;
    installBatSyntax = !isDarwin;
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
      ]
      ++ lib.optionals isDarwin [
        "super+c=copy_to_clipboard"
        "super+v=paste_from_clipboard"
        "super+q=quit"
        "super+w=close_surface"
        "super+t=new_tab"
        "super+n=new_window"
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
