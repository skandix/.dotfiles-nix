{ pkgs, config, ... }:

{
    home-manager.users.hx = {
        programs.firefox = {
            enable = true;
            profiles = {
            legend = {
                isDefault = true;
                };
            };

            extensions = with pkgs.nur.repos.rycee.firefox-addons; [
                buster-captcha-solver
                privacy-badger
                ublock-origin
                bitwarden
            ];
        };
    };
}
