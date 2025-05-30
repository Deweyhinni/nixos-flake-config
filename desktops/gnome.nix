{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.pop-shell
    gnome-tweaks
    gnomeExtensions.just-perfection
    gnomeExtensions.system-monitor
    gnomeExtensions.blur-my-shell
    gnomeExtensions.hide-minimized
    gnomeExtensions.wireless-hid
    gnomeExtensions.wallpaper-slideshow
    gnomeExtensions.removable-drive-menu
  ];
}
