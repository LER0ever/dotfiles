{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        gogs
        caddy
        
    ];
    
    #ExecStart = ''${pkgs.gogs}/bin/gogs web --config /home/gogs/conf/app.ini & pwd'';
    
    services.mysql = {
        enable = true;
        package = pkgs.mariadb;
    };
    
    systemd.services.gogsSession = {
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        serviceConfig = {
            Type = "simple";
            User = "gogs";
            Group = "gogs";
            ExecStart = ''${pkgs.gogs}/bin/gogs web --config /home/gogs/conf/app.ini'';
            Restart = "always";
            WorkingDirectory = "/home/gogs";
            Environment = "USER=gogs HOME=/home/gogs";
            StandardOutput="syslog+console";
            StandardError="syslog+console";
        };
    };
}
