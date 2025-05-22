{ pkgs, unstable, ... }:

{
  #options: https://daiderd.com/nix-darwin/manual/index.html

  environment.systemPackages = with pkgs; [
    git
    pfetch
    neofetch
    talosctl
    docker_28
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
      "mas"
      "p7zip"
      "git"
      "jq"
      "wget"
      "ranger"
      "htop"
      "bat"
      "ffmpeg"
      "wireguard-tools"
      "docker"
      "docker-compose"
      "opentofu"
      "kubeseal"
      "ansible"
      "kubernetes-cli"
      "k9s"
      "openstackclient"
      "poetry"
      "kubecolor"
      "netcat"
      "nmap"
      "wireshark"
      "tcpdump"
      "speedtest-cli"
      "uv"
      "zsh"
      "neovim"
      "tmux"
      "go"
      "rustup"
    ];

    # `brew install --cask`
    casks = [
      "telegram"
      "slack"
      "signal"
      "tor-browser"
      "sublime-text"
      "ghostty"
      "discord"
      "librewolf"
      "microsoft-teams"
      "visual-studio-code"
      "plex"
      "vagrant"
      "virtualbox"
      "tailscale"
      "steam"
      "obsidian"
      "plexamp"
      "bitwarden"
      "thunderbird"
    ];

     #masApps = {
       #Amphetamine = 937984704;
       #Magnet = 441258766;
       #Wireguard = 1451685025;
       #Todoist = 585829637;
     #};
  };
}
