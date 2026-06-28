# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Desktop evirments:
      ./gnome.nix
      # ./cinnamon.nix
      # ./kde.nix
    ];

  # The thing that controls the system booting
  boot.loader.systemd-boot.enable = true;
  
  # Hostname
  networking.hostName = "Blacktop";

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  ## services!

  # Enable networking
  networking.networkmanager.enable = true;

  # Mullvad VPN gui client; needs systemd reslove cause mullvad is a little bitch that needs systemd, even tho it works fine on runit void linux.
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;
  
  # Reqired for mullvad vpn to work; systemd reslov
  services.resolved.enable = true;

  # Enable the X11 windowing system; will throw a warning if using wayland only evirment, but its fine. 
  services.xserver.enable = true; 

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Storage manager:
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  # Allows for the use of non-free packages
  nixpkgs.config.allowUnfree = true;

  # Define all nonroot user account.
  users.users.banana = {
    isNormalUser = true;
    description = "banana";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  pkgs.tutanota-desktop
    #  pkgs.keepassxc
    #  pkgs.mullvad-vpn
    #  pkgs.stremio-linux-shell      
    ];
  };


  # All the system packages.
  environment.systemPackages = with pkgs; [
  ## browsers/browser related stuff.
  pkgs.ladybird
  pkgs.mullvad-browser
  pkgs.firefox
  ## Utils.
  pkgs.tutanota-desktop
  pkgs.keepassxc
  pkgs.mullvad-vpn
  ## Entaiment. 
  pkgs.stremio-linux-shell
  pkgs.discord
  pkgs.steam
  pkgs.git
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
