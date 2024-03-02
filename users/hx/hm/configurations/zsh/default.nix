{ pkgs, ... }:

{
  home-manager.users.hx = {

    programs.zsh = {
      enable = true;
    };
    home.packages = with pkgs; [ pfetch lolcat zinit ];

    home.file.zshrc = {
      source = ./.zshrc;
      target = ".zshrc";
    };
  };
}
