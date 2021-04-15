{pkgs, ...}:

{
    home-manager.users.skandix = {
        home.packages = with pkgs; [
          moc
        ];

        home.file.moc = {
          source = ./config;
          target = "./.moc/config";
        };
    };
}
