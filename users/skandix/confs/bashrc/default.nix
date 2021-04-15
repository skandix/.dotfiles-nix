{pkgs, ...}:

{
  imports = [
    ../neofetch
    ../tmux
    ../moc
    ../git.nix

    ./ls-colors.nix
  ];

    home.packages = with pkgs; [
      bash
      bash-completion
      nix-bash-completions
    ];

    home.file.bashrc = {
      source = ./.bashrc;
      target = ".bashrc";
    };
}
