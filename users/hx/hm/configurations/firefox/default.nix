{ pkgs, config, ... }:

{
  programs.firefox = {
    enable = true;
    #profiles = { legend = { isDefault = true; }; };
    # TODO: add in symlink of userchrome.css, for treestyletabs
    # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    #     buster-captcha-solver
    #     privacy-badger
    #     ublock-origin
    #     bitwarden
    # ];
  };

  # home-manager.users.hx = {
  # };
}
