{pkgs, ...}:
{
    home-manager.users.skandix = {
        home.packages = with pkgs; [
            mfoc
            mfcuk
        ];
    };
}