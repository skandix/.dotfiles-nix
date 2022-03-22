{ pkgs, ... }:

{
  home-manager.users.skandix = {
    programs.git = {
      package = pkgs.unstable.gitAndTools.gitFull;
      enable = true;
      extraConfig = {
        core.editor = "vim";
        user.useConfigOnly = true;
        user.personal.name = "Bendik Dyrli";
        user.personal.email = "bendik.dyrli@gmail.com";
        # user.personal.signingkey = "";
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };
  };
}
