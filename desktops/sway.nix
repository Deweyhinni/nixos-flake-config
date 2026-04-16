{config, pkgs, lib, user, ...}:
{
  environment.systemPackages = with pkgs; [
    grim
    slurp
    sway-contrib.grimshot
    wl-clipboard
    mako
    waybar
    wofi
    bluetuith
    pwvucontrol
    playerctl
    swaybg
    swayidle
    nautilus
    loupe
    catppuccin-gtk
    # networkmanagerapplet
  ];

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "sway";
  #       user = "${user}";
  #     };
  #   };
  # };

  programs.regreet = {
    enable = true;
    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
    };
  };

  security.pam.services = {
    regreet.enableGnomeKeyring = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
  };
}
