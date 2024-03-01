{ pkgs, ... }:

{
    programs.git = {
      enable = true;
      extraConfig = {
        core.editor = "vim";
        user.useConfigOnly = true;
        user.name = "Bendik";
        user.email = "skandix@protonmail.com";
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };
}
