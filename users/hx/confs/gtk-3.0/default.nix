{pkgs, ...}:

{
  home-manager.users.hx = {
    gtk.gtk3.extraConfig = ''
      gtk-application-prefer-dark-theme = true
    '';
  };
}
