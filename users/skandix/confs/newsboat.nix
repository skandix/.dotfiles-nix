{config, pkgs, ...}:

{
    home-manager.users.skandix = {
        programs.newsboat = {
            enable = true;
            urls = [
                { url = https://blog.jonasbengtson.se/feed.rss; }
                { url = https://weekly.nixos.org/feeds/all.rss.xml; }
                { url = https://news.ycombinator.com/rss; }
                { url = https://www.nrk.no/toppsaker.rss; }
                { url = https://www.wired.com/feed/rss; }
                { url = https://christine.website/blog.rss; }
            ];
            autoReload = true;
            reloadTime = 300;
            extraConfig = ''
                # unbind defaults
                unbind-key ENTER
                unbind-key h
                unbind-key j
                unbind-key k
                unbind-key l
                # vim style movement
                bind-key h quit
                bind-key j down
                bind-key k up
                bind-key l open
                # home/end
                unbind-key g
                bind-key g home
                unbind-key G
                bind-key G end
            '';
        };
    };
}
