{ config, pkgs, ... }:

{
 # Lightdm, cinnamon, online apps.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  environment.sessionVariables = {
    MOZ_USE_XINPUT2=1; # Fix Firefox-based browsers scroll on X11.
  };
 
  environment.systemPackages = [
    # Any apps that I want for cinnamon only, non as of now
  ];
}
