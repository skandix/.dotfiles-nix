{config, pkgs, ...}:
{
    home-manager.users.skandix = {
        home.packages = with pkgs; [
            autorandr
        ];
        xdg.configFile = {
            "autorandr/stack/config".source = ./stack/config;
            "autorandr/stack/setup".source = ./stack/setup;
        };
    };
}