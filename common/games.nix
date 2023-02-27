{pkgs, config, ...}:

{
    home-manager.users.hx = {
        home.packages = with pkgs; [
            lutris-unwrapped
            wine-staging
            gamemode
            mangohud
        ];
    };
}
