{ config, pkgs, ... }:

{
  hardware.trackpoint = {
    enable = true;
    sensitivity = 255;
    speed = 255;
    emulateWheel = true;
  };
  
}
