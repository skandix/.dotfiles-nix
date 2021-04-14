{pkgs, ...}:

{
  imports = [
    ../neofetch
    ../tmux
    ../moc
    #../git.nix
  ];

    home.packages = with pkgs; [
      bash
      bash-completion
      nix-bash-completions
    ];
    # not sure if this is the rigth way of using option.. :thinking:
    home.file.bashrc = {
      source = ./.bashrc;
      target = ".bashrc";
    };
}
