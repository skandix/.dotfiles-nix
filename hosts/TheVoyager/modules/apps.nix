{ pkgs, unstable, homebrew-core, homebrew-cask, ... }:

{
  #options: https://daiderd.com/nix-darwin/manual/index.html

  environment.systemPackages = with pkgs; [
    git
    pfetch
    neofetch
    terraform
    reveal-md
    talosctl
    vscode
    #librewolf
  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    # brewPrefix = "/opt/homebrew/bin";
    caskArgs = {
      no_quarantine = true;
    };

    global = {
      brewfile = true;
    };


    # `brew install`
    brews = [
      "p7zip"
      "git"
      "jq"
      "wget"
      "ranger"
      "htop"
      "bat"
      "ffmpeg"
      "docker"
      "docker-compose"
      "netcat"
      "nmap"
      "wireshark"
      "tcpdump"
      "speedtest-cli"
      "ansible"
      "kubernetes-cli"
      "k9s"
      "mas"
      "openstackclient"
      "poetry"
      "uv"
      "zsh"
      "neovim"
      "tmux"
      "kubecolor"
      "go"
      "opentofu"
      "kubeseal"
    ];

    # `brew install --cask`
    casks = [
      "telegram"
      "signal"
      "tor-browser"
      "sublime-text"
      "ghostty"
      "discord"
      "librewolf"
      "microsoft-teams"
      #"visual-studio-code"
      "plexamp"
      "plex"
      "slack"
      "vagrant"
      "virtualbox"
      "tailscale"
      "steam"
      "obsidian"
    ];

    masApps = {
      Amphetamine = 937984704;
      Magnet = 441258766;
      Wireguard = 1451685025;
    };
  };

  nix-homebrew = {
    enable = true;
    autoMigrate = true;
    enableRosetta = true;

    user = "skandix";
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
    };
    mutableTaps = false;
  };
}
