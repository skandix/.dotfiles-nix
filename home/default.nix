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
    shell = pkgs.zsh; # TODO: fix this properly, and figure out if i want fish or zsh.. hard to choose
  };

  home-manager.users = {
    hx = (import ./hx/hm/base.nix);
  };
}
