{home-manager, pkgs, ... }:

{
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
      "podman"
    ];
    group = "hx";
    shell = pkgs.zsh;
  };

  home-manager.users = {
    hx = (import ./hx/hm/base.nix);
  };
}
