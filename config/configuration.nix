# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  #############################################################################
  ### Bootloader
  #############################################################################
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only


  #############################################################################
  ### Environment Variables
 ##############################################################################
  
 #
  #############################################################################
  ### Localization
  #############################################################################
  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "America/New_York";


  #############################################################################
  ### Networking
  #############################################################################
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  

  #############################################################################
  ### Packages
  #############################################################################
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    # 3DP
    cura
    openscad

    # DE
    compton
    conky
    feh
    firefox
    i3-gaps
    kitty
    libnotify
    lightdm
    lightdm_gtk_greeter
    neofetch
    polybar
    pywal
    transmission-gtk
    vifm

    # Dev
    cargo
    clang
    cmake
    git
    neovim
    python37
    python37Packages.ipython
    python37Packages.pip

    # Media
    alsaUtils
    discord
    linux-steam-integration
    steam
    vlc

    # Office
    libreoffice
    neomutt
    zathura

    # Terminal
    kitty

    # Terminal Tools
    bat
    nmap
    tcpdump
    traceroute
    w3m

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  #############################################################################
  ### Services
  #############################################################################

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  #############################################################################
  ### User Configuration
  #############################################################################
  users.users.a = {
    createHome = true;
    home = "/home/a";
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  #############################################################################
  ### This value determines the NixOS release with which your system is to be
  ### compatible, in order to avoid breaking some software such as database
  ### servers. You should change this only after NixOS release notes say you
  ### should.
  #############################################################################
  system.stateVersion = "19.03"; # Did you read the comment?

}
