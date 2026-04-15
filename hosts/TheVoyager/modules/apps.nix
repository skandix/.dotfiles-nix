{ unstable, ... }:

{
  #options: https://daiderd.com/nix-darwin/manual/index.html

  services.defaultBrowser = {
    enable = true;
    browser = "librewolf";
  };

  environment.systemPackages = with unstable; [
    git
    talosctl
    docker
  ];

  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = "hx";
    mutableTaps = true;
    autoMigrate = true;
  };
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    # brewPrefix = "/opt/homebrew/bin";
    caskArgs = {
      no_quarantine = true;
    };

    global = {
      brewfile = true;
    };

    #taps = [];
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
      "tcpdump"
      "speedtest-cli"
      "uv"
      "zsh"
      "neovim"
      "tmux"
      "go"
      "rustup"
      "marp-cli"
      "uv"
      "ruff"
      "mole"
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
      "wireshark-app"
      "steam"
      "obsidian"
      "plexamp"
      "container"
      "rectangle"
      "google-chrome"
      "inkscape"
      "gimp"
      "zotero"
      "blender"
      "macfuse"
      "1password"
    ];

     masApps = {
       Amphetamine = 937984704;
       Wireguard = 1451685025;
       Tailscale = 1475387142;
       Telegram = 747648890;
     };
  };
}
