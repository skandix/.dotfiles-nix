{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    vscodium

    vscode-extensions = [

      ### SLIDES
      marp-team.marp-vscode

      ### REMOTE SSH
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit

      ### KUBERNETES
      ms-kubernetes-tools.vscode-kubernetes-tools

      ### KUBERNETES
      redhat.ansible

      ### PRETTIER
      esbenp.prettier-vscode

      ### PYTHON
      ms-python.vscode-pylance
      ms-python.python
      charliermarsh.ruff
      njpwerner.autodocstring

      ### SHELL SCRIPTING
      timonwong.shellcheck

      ### CSS FRAMEWORK
      bradlc.vscode-tailwindcss

      ### NIX
      jnoortheen.nix-ide

      ### MISC
      shardulm94.trailing-spaces
      christian-kohler.path-intellisense
      dendron.dendron-paste-image

      ### COLORS
      pkief.material-icon-theme
      oderwat.indent-rainbow
      catppuccin.catppuccin-vsc
    ];
  ];
};