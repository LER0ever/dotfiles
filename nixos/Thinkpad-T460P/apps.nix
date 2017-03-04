{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        # Web
        google-chrome
        # firefox

        # Social 
        tdesktop

        # Media
        mpd
        cantata
        vlc

        # Productivity
        libreoffice
        thunderbird
        goldendict

    ];

}
