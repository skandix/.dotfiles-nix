{pkgs, ...}:

{
    home.packages = with pkgs; [
      moc
    ];

    home.file.moc = {
      source = ./config;
      target = "./.moc/config";
    };

    #home.file.moc.recursion = {
      #source = ./theme/nigthly_theme;
      #target = "./.moc/theme/nigthly_theme";
    #};

}
