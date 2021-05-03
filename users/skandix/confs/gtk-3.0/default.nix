{pkgs, ...}:

{
  home-manager.users.skandix = {
    gtk.gtk3.extraConfig = ''
      gtk-application-prefer-dark-theme = true
    '';
  };
}
