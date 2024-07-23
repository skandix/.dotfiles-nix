{ pkgs, ... }:

{
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "skandix";
    userEmail = "bendik.dyrli@gmail.com";
    # extraConfig = {
    #   core.editor = "vim";
    #   init.defaultBranch = "main";
    #   pull.rebase = true;
    #   push.autoSetupRemote = true;
    #   rebase.autosquash = true;
    #   commit.verbose = true;
    #   diff.algorithm = "histogram";
    #   url."ssh://git@github.com:".insteadOf = "git://github.com";
    #   rerere.enabled = true;
    #   # identities
    #   user.useConfigOnly = true;
    #   user.personal.name = "Bendik Dyrli";
    #   user.personal.email = "bendik.dyrli@gmail.com";
    # };
  };
}
