{ ... }:

{
  imports = [
    ../../../home/hx/modules/ghostty
    ../../../home/hx/modules/mpv
    ../../../home/hx/modules/librewolf
    ../../../home/hx/modules/go.nix
    ../../../home/hx/modules/python.nix
    ../../../home/hx/modules/rust.nix
  ];

  home = {
    username = "hx";
    homeDirectory = "/Users/hx";
    stateVersion = "26.05";

    sessionPath = [ "$HOME/.local/bin" ];

    sessionVariables = {
      PAGER = "less";
      BROWSER = "librewolf";
      TERMINAL = "ghostty";
    };
  };
}
