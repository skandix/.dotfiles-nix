{ pkgs, unstable, ...}: {
  #options: https://daiderd.com/nix-darwin/manual/index.html

  environment.systemPackages = with pkgs; [
    git
    pfetch
    neofetch
    terraform
    reveal-md
    # plex-media-player
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

    taps = [
      "homebrew/services"
    ];

    # `brew install`
    brews = [
      "p7zip"
      "git"
      "jq"
      "wget"
      "ncdu"
      "htop"
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
      "lolcat"
      "zsh"
      "neovim"
      "tmux"
      "kubecolor"
    ];

    # `brew install --cask`
    casks = [
      "telegram"
      "signal"
      "tor-browser"
      "sublime-text"
      "discord"
      "librewolf"
      "microsoft-teams"
      "visual-studio-code"
      "plexamp"
      "plex-media-player"
      "slack"
      "keybase"
      "vagrant"
      "virtualbox"
      "tailscale"
      "swinsian"
      "steam"
      "obsidian"
    ];

    masApps = {
      Amphetamine = 937984704;
      Magnet = 441258766;
      Wireguard = 1451685025;
    };
  };
}
