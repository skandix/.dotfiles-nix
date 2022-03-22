{config, pkgs, ...}:


{
imports = [
  ../../scripts/default.nix
];

  home-manager.users.skandix = {
    home.packages  = with pkgs; [
      _Discord
      ch_setup
      diff_hours
      mpvuia
      profileuia
    ];
  };
}
