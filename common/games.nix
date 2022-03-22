{pkgs, config, ...}:

{
    home-manager.users.skandix = {
        home.packages = with pkgs; [
            lutris-unwrapped
            unstable.wine-staging
            gamemode
            mangohud
        ];
    };
}
