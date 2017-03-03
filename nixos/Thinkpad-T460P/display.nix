{ config, pkgs, ... }:

{
  services.xserver = {
    deviceSection = ''
	Option "TearFree" "true"
    '';
  };
}
