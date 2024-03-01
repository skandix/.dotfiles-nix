{pkgs, ...}:

{
    gtk.gtk3.extraConfig = ''
      gtk-application-prefer-dark-theme = true
    '';
}
