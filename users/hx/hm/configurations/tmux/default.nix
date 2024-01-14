{pkgs, ...}:

{
    home-manager.users.hx = {
        home.packages = with pkgs; [
            tmux
            tmux-cssh
        ];
        home.file.tmux = {
            source = ./files/tmux.conf;
            target = ".tmux.conf";
        };
    };
}