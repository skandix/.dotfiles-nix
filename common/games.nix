{pkgs, config, ...}:

{
    #home-mananger.users.skandix = {
        home.packages = with pkgs; [
            lutris-unwrapped
            unstable.wine-staging
            minecraft
            multimc
        ];
    #};
}
