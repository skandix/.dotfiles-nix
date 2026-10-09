{
  pkgs,
  unstable,
  ...
}:

{
  # fix openldap issue with lutris
  nixpkgs.overlays = [
    (final: prev: {
      openldap = prev.openldap.overrideAttrs (_: {
        doCheck = false;
      });
    })
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services = {
    flatpak.enable = true;
    ratbagd = {
      enable = true;
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    protontricks.enable = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  users.users.hx.extraGroups = [ "gamemode" ];
  programs = {
    gamemode = {
      enable = true;
      settings = {
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };
  };

  boot.kernel.sysctl."kernel.split_lock_mitigate" = 0;

  # Remember
  # - Bottles did not work good without flatpak, why it is not listed here

  environment.systemPackages = with pkgs; [
    lutris
    winetricks
    winePackages.stagingFull
    r2modman
    prismlauncher
    unstable.wowup-cf
    protonplus
    piper
  ];

}
