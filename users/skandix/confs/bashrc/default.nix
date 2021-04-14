{pkgs, ...}:

{
  imports = [
    ../neofetch
    ../tmux
    ../moc
    ../git.nix
  ];

  home-manager.users.skandix = {
    home.packages = with pkgs; [
      bash
      bash-completion
      nix-bash-completions
    ];
    # not sure if this is the rigth way of using option.. :thinking:
    xdg.dataHome = {
      ".bashrc".source = ./.bashrc;
    };
  };
}