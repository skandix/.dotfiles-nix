{home-manager, pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  programs.fish.enable = true;
  users.groups.hx.gid = 1000;
  users.users.hx = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
      "audio"
      "video"
      "screen"
      "plugdev"
      "libvirtd"
      "input"
      "lp"
      "scanner"
      "networkmanager"
      "wireshark"
      "vboxusers"
    ];
    group = "hx";
    shell = pkgs.fish;
  };

  home-manager.users = { hx = (import ./hx/hm/base.nix); };
}
