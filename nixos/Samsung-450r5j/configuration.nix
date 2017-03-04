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
			./display.nix
			./bluetooth.nix
			./dev.nix
			./apps.nix
			./cli.nix
			./server.nix

#      ./thinkpad.nix
		];

# Use the systemd-boot EFI boot loader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking = {
		hostName = "LER0ever-Samsung-NixOS";
		networkmanager.enable = true;
		firewall = {
			enable = false;
		};
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
	];

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

	users.extraGroups.everette.gid = 5000;
# Define a user account. Don't forget to set a password with ‘passwd’.
	users.extraUsers.everette = {
		isNormalUser = true;
		uid = 1000;
		extraGroups=["wheel" "everette" "users"];
	};

	users.extraGroups.gogs.gid = 5007;

	users.extraUsers.gogs = {
		isNormalUser = true;
		uid = 1007;
		extraGroups=["gogs"];
	};

	users.extraUsers.caddy = {
	};

	users.extraUsers.Cherubim = {
		isNormalUser = true;
		uid = 1003;
		extraGroups = ["wheel"];
	};

# The NixOS release to be compatible with for stateful data such as databases.
	system.stateVersion = "16.09";

}
