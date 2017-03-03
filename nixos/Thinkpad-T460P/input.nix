{ config, pkgs, ... }:

{
  services.xserver.synaptics =
  {
    enable = true;
    twoFingerScroll = true;
    tapButtons = true;
    maxSpeed = "4.0";
    minSpeed = "1.2";
    accelFactor = "0.005";
    scrollDelta = -150;
    palmDetect = true;
  };

}

