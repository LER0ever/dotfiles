{ config, pkgs, ...}:

{
    programs.fish.enable = true;
    users.defaultUserShell = "/run/current-system/sw/bin/fish";
    environment.systemPackages = with pkgs; [
        cmus
        neofetch
        screenfetch
        irssi
        neomutt
        htop
        syncthing
        tmux

        gnupg1 # fix plasma widgets
    ];
}
