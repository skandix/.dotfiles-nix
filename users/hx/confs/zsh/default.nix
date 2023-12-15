{config, pkgs, ...}:

{
  imports = [
    ../pfetch
    ../tmux
    ../moc
    #../git.nix

    ./ls-colors.nix
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
