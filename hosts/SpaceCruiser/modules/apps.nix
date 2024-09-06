{ pkgs, unstable, ...}: {
  #options: https://daiderd.com/nix-darwin/manual/index.html

  environment.systemPackages = with pkgs; [
    git
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
      "terraform"
      "kubernetes-cli"
      "k9s"
      "mas"
      "openstackclient"
      # "obs"
      # "obs-browser"
      "binwalk"
      "poetry"
      "pfetch"
      "lolcat"
      "neofetch"
      "zsh"
      "neovim"
      "tmux"
    ];

    # `brew install --cask`
    casks = [
      "telegram"
      "signal"
      "tor-browser"
      "sublime-text"
      "discord"
      "librewolf"
      "mumble"
      "microsoft-teams"
      "zoom"
      "visual-studio-code"
      "plexamp"
      "plex-media-player"
      "slack"
      "libreoffice"
      "sonic-visualiser"
      "keybase"
      "vagrant"
      "virtualbox"
      "tailscale"
      "swinsian"
      "binary-ninja"
      "steam"
      "obsidian"
      "mpv"
    ];

    masApps = {
      Amphetamine = 937984704;
      Magnet = 441258766;
      Wireguard = 1451685025;
    };
  };
}
