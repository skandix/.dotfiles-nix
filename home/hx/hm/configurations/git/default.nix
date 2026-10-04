{ pkgs, ... }:

{
  programs = {
    git = {
      package = pkgs.gitFull;
      enable = true;
      settings = {
        core.editor = "vim";
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
        rebase.autosquash = true;
        commit.verbose = true;
        diff.algorithm = "histogram";
        url."git@github.com:".insteadOf = "https://github.com";
        rerere.enabled = true;
        # identities
        user = {
          name = "hx";
          email = "bendik@hjkl.no";
          useConfigOnly = true;
        };
      };
      includes = [{
          condition = "gitdir:~/work/";
          contents = {
            user = {
              name = "Bendik Dyrli";
              email = "bendik.dyrli@uia.no";
            };
          };
        }
      ];
    };
    lazygit = {
      enable = true;
    };
  };
}
