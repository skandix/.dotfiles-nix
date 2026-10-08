{ pkgs, lib, ... }:

{
  programs.nix-index-database.comma.enable = true;

  home-manager.users.hx = {
    imports = [
      ./modules/vim
      ./modules/tmux
      ./modules/k9s
      ./modules/git
      ./modules/zsh
    ];

    home.packages = with pkgs; [
      p7zip
      jq
      htop
      wget
      ncdu
      ranger
      bat
      marp-cli
      typst

      # SRE
      talosctl
      kubectl
      krew
      opentofu
      ansible
      openstackclient
      kubernetes-helm
      kubeseal
      kubecolor
      packer
      cilium-cli
    ];
  };

  # CLEANUP LINUX
  systemd.user.tmpfiles.rules = lib.mkIf pkgs.stdenv.isLinux [
    "e %h/.cache - - - 30d"
    "e %h/.local/share/Trash - - - 30d"
  ];

  # CLEANUP MACOS
  launchd.agents.clean-cache = lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;
    config = {
      ProgramArguments = [
        "/bin/sh"
        "-c"
        ''
          /usr/bin/find "$HOME/.cache" -mindepth 1 -mtime +30 -delete 2>/dev/null
          /usr/bin/find "$HOME/.cache" -mindepth 1 -type d -empty -delete 2>/dev/null
          true
        ''
      ];
      StartCalendarInterval = [
        {
          Hour = 12;
          Minute = 0;
        }
      ];
    };
  };
}
