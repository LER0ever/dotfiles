{ config, pkgs, ... }:
{
	imports =
		[ # Include the results of the hardware scan.
		];

	environment.systemPackages = with pkgs; [
		neovim
			vim
			git
			vscode

			go
			glide
			#nodejs-7_x
			python3
			python27Full

			go2nix
			patchelf

			#python27Packages.twisted
			python35Packages.bootstrapped-pip
			python35Packages.neovim
			python35Packages.twisted
	];

}

