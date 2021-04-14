{pkgs, ...}:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      moc
    ];

    # not sure if this is the rigth way of using option.. :thinking:
    xdg.dataHome = {
      ".moc/config".source = ./config;
      ".moc/theme/nigthly_theme".source = ./theme/nightly_theme;
    };
  };
}