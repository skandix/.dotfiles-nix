{config, ...}:






{
    #home-manager.users.skandix = {
         #home.file."diff-hours".source = config.lib.file.mkOutOfStoreSymlink ./diff_hours.py;
         #home.file."/usr/bin/mpvuia".source = config.lib.file.mkOutOfStoreSymlink ./mpvuia.sh;
         #home.file."/usr/bin/_Obsidian".source = config.lib.file.mkOutOfStoreSymlink ./_Obsidian.sh;
         #home.file."/usr/bin/profileuia".source = config.lib.file.mkOutOfStoreSymlink ./profileuia.sh;
         #home.file."/usr/bin/_Telegram".source = config.lib.file.mkOutOfStoreSymlink ./_Telegram.sh;
         #home.file."/usr/bin/uiasearch".source = config.lib.file.mkOutOfStoreSymlink ./uiasearch.py;
    #};
}
