{config, pkgs, ...}:

{
  imports = [
    ../pfetch
    ../tmux
    ../moc

    ./ls-colors.nix
  ];

  home-manager.users.hx = {
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
