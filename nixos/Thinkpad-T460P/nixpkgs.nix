{ config, pkgs, ...}:

{
    nixpkgs.config= {
        allowUnfree = true;
        enableParallelBuilding = true;
        permittedInsecurePackages = [
            "libplist-1.12"
        ];
    };
}
