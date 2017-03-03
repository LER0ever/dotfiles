{ config, pkgs, ...}:

{
    programs.fish.enable = true;
    users.defaultUserShell = "/run/current-system/sw/bin/fish";
    environment.systemPackages = with pkgs; [
        cmus
        syncthing
    ];
}
