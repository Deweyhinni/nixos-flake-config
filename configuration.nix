# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, user, ... }:

{
  imports = [
  ];

  /*
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;
  */

  # systemd.user.extraConfig = "DefaultTimeoutStopSec=10s";
  # systemd.extraConfig = "DefaultTimeoutStopSec=10s";

  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
  };

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = [
      pkgs.networkmanager-openvpn
    ];
  };

  # Set your time zone.
  time.timeZone = "Atlantic/Reykjavik";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "is_IS.UTF-8";
    LC_IDENTIFICATION = "is_IS.UTF-8";
    LC_MEASUREMENT = "is_IS.UTF-8";
    LC_MONETARY = "is_IS.UTF-8";
    LC_NAME = "is_IS.UTF-8";
    LC_NUMERIC = "is_IS.UTF-8";
    LC_PAPER = "is_IS.UTF-8";
    LC_TELEPHONE = "is_IS.UTF-8";
    LC_TIME = "is_IS.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    uid = 1000;
    description = "Frey";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    git
    zsh
    gcc
    file
    ghostty
    pciutils
    gnumake
    qemu
    gdb
    nasm
    devenv
    nushell
    fd
    rename
  ];

  services.flatpak.enable = true;

  fonts.packages = with pkgs; [
    font-awesome_4
    nerd-fonts.fira-code
    nerd-fonts.envy-code-r
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs = {
    zsh = {
      enable = true;
    };
    git = {
      enable = true;
      lfs.enable = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  security.polkit.enable = true;

  # Enable cosmic desktop
  # services = {
  #   displayManager.cosmic-greeter.enable = true;
  #   desktopManager.cosmic.enable = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix = {
    gc = {
      automatic = true;
      dates = "biweekly";
      options = "--delete-older-than 14d";
    };

    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];

    settings.trusted-users = [ "root" "@wheel" ];

    settings.substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    settings.trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

    nixpkgs.config.permittedInsecurePackages = [
      "libsoup-2.74.3"
      "qtwebengine-5.15.19"
    ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
