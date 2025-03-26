{
  config,
  pkgs,
  unstable,
  ...
}:

{
  imports = [
    ./hm/configurations/vim
    ./hm/configurations/tmux
    ./hm/go.nix
    ./hm/python.nix
    ./hm/rust.nix
  ];

  programs.nix-index-database.comma.enable = true;

  home-manager.users.hx = {
    home.packages = with pkgs; [
      p7zip
      zlib
      gnutar

      gnumake
      gnome-keyring
      
      jq
      htop
      bat
      wget
      ntfs3g
      ncdu
      ranger

      reveal-md
      bambu-studio
    ];
  };
}
