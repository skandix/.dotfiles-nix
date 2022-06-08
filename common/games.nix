{pkgs, config, ...}:

{
    home-manager.users.skandix = {
        home.packages = with pkgs; [
            lutris-unwrapped
            wine-staging
            gamemode
            mangohud
        ];
    };
}
