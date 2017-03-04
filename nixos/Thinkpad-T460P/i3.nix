{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
		./fonts.nix
		];

	environment.systemPackages = with pkgs; [
		neofetch
		rcm
		rofi
		i3blocks
		font-awesome-ttf
		conky
		terminator
		pcmanfm
		nitrogen
		networkmanagerapplet

# i3blocks requirements
		bc
		wirelesstools
	];

	services =
	{
		xserver =
		{
			enable = true;
			windowManager.i3.enable = true;
			windowManager.i3.package = pkgs.i3-gaps;
			desktopManager.xterm.enable = false;
		};
	};

}
