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
        url."ssh://git@github.com:".insteadOf = "git://github.com";
        rerere.enabled = true;
        # identities
        user = {
          name = "hx";
          email = "hx@datapor.no";
          useConfigOnly = true;
        };
      };
    };

    lazygit = {
      enable = true;
      #package = unstable.lazygit;
      #settings = {
        #nerdFontsVersion="3";
      #};
    };
};

}
