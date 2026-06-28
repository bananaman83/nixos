{ config, pkgs, ... }:

{
 # Xfce or Cinnamon or gnome, sets Lightdm as login manage.
  services.xserver.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Gnome app removal:
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs epiphany ];
  
  environment.systemPackages = [
    pkgs.firefox-gnome-theme # theme to make firefox fit the gnome theme
  ];
}
