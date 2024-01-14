{pkgs, ...}:

{
    home-manager.users.hx = {
        home.packages = with pkgs; [
            tmux
            tmux-cssh
        ];

        home.file = {
            "/files/tmux.conf".source = ./tmux.conf;
        };
    };
}
