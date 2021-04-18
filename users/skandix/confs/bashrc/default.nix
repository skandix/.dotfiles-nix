{config, pkgs, ...}:

{
  imports = [
    ../neofetch
    ../tmux
    ../moc
    #../git.nix
    ../newsboat.nix

    ./ls-colors.nix
  ];

  home-manager.users.skandix = {
    home.packages = with pkgs; [
      bash
      bash-completion
      nix-bash-completions
    ];

    home.file.bashrc = {
      source = ./.bashrc;
      target = ".bashrc";
    };
  };
}
