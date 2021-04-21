{config, pkgs, ...}:

{
  imports = [
    ../pfetch
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
      pfetch
    ];

    home.file.bashrc = {
      source = ./.bashrc;
      target = ".bashrc";
    };
  };
}
