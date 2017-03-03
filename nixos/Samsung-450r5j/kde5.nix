{ config, pkgs, ...}:
{
  services.xserver = {
    displayManager.lightdm.enable = true;
    desktopManager.plasma5 = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    kdeconnect
    kdeApplications.okular
    kdeApplications.ark
    kdeApplications.gwenview
    kdeApplications.spectacle
    
    kate

    gnome-breeze
  ];
}
