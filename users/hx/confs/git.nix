{ pkgs, ... }:

{
  home-manager.users.hx = {
    programs.git = {
      enable = true;
      extraConfig = {
        core.editor = "vim";
        user.useConfigOnly = true;
        user.personal.name = "Bendik";
        user.personal.email = "skandix@protonmail.com";
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };
  };
}
