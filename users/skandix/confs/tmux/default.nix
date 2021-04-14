{pkgs, ...}:

{
    home-manager.users.skandix = {
        home.packages = with pkgs; [
            tmux
            tmux-cssh
        ];
        xdg.dataHome = {
            ".tumx.conf".source() = ./tumx.conf
        };
    };
}