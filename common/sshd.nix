{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    banner = "
 ███▄ ▄███▓▓█████  ▒█████   █     █░
▓██▒▀█▀ ██▒▓█   ▀ ▒██▒  ██▒▓█░ █ ░█░
▓██    ▓██░▒███   ▒██░  ██▒▒█░ █ ░█ 
▒██    ▒██ ▒▓█  ▄ ▒██   ██░░█░ █ ░█ 
▒██▒   ░██▒░▒████▒░ ████▓▒░░░██▒██▓ 
░ ▒░   ░  ░░░ ▒░ ░░ ▒░▒░▒░ ░ ▓░▒ ▒  
░  ░      ░ ░ ░  ░  ░ ▒ ▒░   ▒ ░ ░  
░      ░      ░   ░ ░ ░ ▒    ░   ░  
       ░      ░  ░    ░ ░      ░    
";
    settings = {
      #PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };
}
