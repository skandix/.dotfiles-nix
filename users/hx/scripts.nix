{config, pkgs, ...}:


{
imports = [
  ../../scripts/default.nix
];

  home-manager.users.hx = {
    home.packages  = with pkgs; [
      _Discord
      ch_setup
      diff_hours
      mpvuia
      profileuia
    ];
  };
}
