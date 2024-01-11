{config, pkgs, ...}:

{
  imports = [
    ../pfetch
    ../tmux
  ];

  home-manager.users.hx = {
    home.packages = with pkgs; [
      zsh
      pfetch
      lolcat
      zinit
    ];

    home.file.bashrc = {
      source = ./.zshrc;
      target = ".zshrc";
    };
  };
}
