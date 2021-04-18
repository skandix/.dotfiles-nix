{config, pkgs, ...}:

{
    home-manager.users.skandix = {
        programs.newsboat = {
            enable = true;
            urls = [
                { url = https://nrkbeta.no/feed/; }
                { url = https://blog.jonasbengtson.se/feed.rss; }
                { url = https://www.matteomalvica.com/index.xml; }
                { url = https://hexler.net/feed; }
                { url = https://blog.cloudflare.com/; }
                { url = https://hacks.mozilla.org/feed/; }
                { url = https://news.ycombinator.com/rss; }
                { url = https://www.cyclingweekly.com/feeds/newsblog.rss; }
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