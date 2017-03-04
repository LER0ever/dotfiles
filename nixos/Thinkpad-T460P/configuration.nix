# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixpkgs.nix
      ./libs.nix
      ./i3.nix
      ./kde5.nix
      ./input.nix
      ./ime.nix
      ./display.nix
      ./bluetooth.nix
      ./dev.nix
      ./apps.nix
      ./cli.nix
      
      ./thinkpad.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "LER0ever-T460P-NixOS";
    networkmanager.enable = true;
  };

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  environment.systemPackages = with pkgs; [
     nox
     aria2
     wget
     neofetch
     screenfetch
  ];

  hardware = {
    bumblebee.enable = true;
    cpu.intel.updateMicrocode = true;
  };

  services =
  {
    locate.enable = true;
    samba.enable = true;
    openssh.enable = true;
    printing =
    {
      enable = true;
      #drivers = [ pkgs.gutenprint ];
    };
    xserver =
    {
      enable = true;
      layout = "us";
      xkbOptions = "compose:caps";
    };
  };

    # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.everette = {
    isNormalUser = true;
    uid = 1000;
    extraGroups=["wheel"];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

}
