{ config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        python35Packages.requests2
        python35Packages.beautifulsoup4
        python35Packages.pycrypto
        python35Packages.future
    ];
}
