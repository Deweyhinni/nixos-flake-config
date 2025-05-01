{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      displayManger.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
}
