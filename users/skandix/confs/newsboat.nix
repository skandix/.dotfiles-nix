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
                { url = https://weekly.nixos.org/feeds/all.rss.xml; }
                { url = https://hacks.mozilla.org/feed/; }
                { url = https://news.ycombinator.com/rss; }
                { url = https://www.nrk.no/toppsaker.rss; }
                { url = https://telenorsoc.blogspot.com/feeds/posts/default?alt=rss; }
                { url = https://www.wired.com/feed/rss; }
                { url = https://www.kode24.no/?lab_viewport=rss; }
                { url = https://signal.org/blog/rss.xml; }
                { url = https://francis.begyn.be/blog.rss; }
                { url = https://blog.cloudflare.com/rss/; }
                { url = http://sreweekly.com/feed/; }
                { url = https://boards.4channel.org/g/index.rss; }
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
