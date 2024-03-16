{ pkgs, ...}: {
  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    git
  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  # 
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    taps = [
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
    ];

    # `brew install`
    brews = [
      ansible 
      terraform
      mas
      openstackclient
      p7zip
      jq
      wget
      ncdu
      htop
      ffmpeg
      volatility
      hexedit
      netcat
      gobuster
      hydra
      john
      nmap
      wireshark
      docker
      docker-compose
      kubernetes-cli
      k9s
      mfoc
      mfcuk
      tcpdump
      speedtest-cli
    ];

    # `brew install --cask`
    casks = [
      vagrant
      virtualbox
      swinsian
      dozer
      binary-ninja
      tailscale
      keybase
      ghidra
      sonic-visualiser
      burp-suite
      metasploit
      telegram
      signal
      tor-browser
      sublime-text
      mumble
      microsoft-teams
      zoom
      visual-studio-code
      plexamp
      plex-media-player
      slack
    ];

    mas = {
      "Magnet" = 441258766;
      "Amphetamine" = 937984704;
      "WireGuard" = 1451685025;
    };
  };
}
