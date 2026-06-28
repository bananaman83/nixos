{ config, pkgs, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  # Removes kde apps I don't need or use
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.konversation # IRC client
    kdePackages.kpat # Solitaire
    kdePackages.ksudoku
    kdePackages.ktorrent
    kdePackages.kmahjongg
    kdePackages.kmines
    kdePackages.konversation
  ];
  #add some kde packages I may need or use
  environment.systemPackages = [
    # KDE Utilities
   # kdePackages.discover # Optional: Software center for Flatpaks/firmware updates
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Character map
   # kdePackages.kclock # Clock app
    kdePackages.kcolorchooser # Color picker
    kdePackages.kolourpaint # Simple paint program
    kdePackages.ksystemlog # System log viewer
    kdePackages.sddm-kcm # SDDM configuration module
    kdiff3 # File/directory comparison tool
  
    # Hardware/System Utilities (Optional)
   # kdePackages.isoimagewriter # Write hybrid ISOs to USB
   # kdePackages.partitionmanager # Disk and partition management
   # hardinfo2 # System benchmarks and hardware info
    wayland-utils # Wayland diagnostic tools
    wl-clipboard # Wayland copy/paste support
    
  ];
}
