{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      font-awesome-ttf  # font-awesome for i3blocks
      source-han-sans-simplified-chinese # Noto CJK
      #nerdfonts # for EverVim
    ];
  };
}

