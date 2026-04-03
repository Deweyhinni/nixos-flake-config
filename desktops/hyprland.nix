{ config, pkgs, user, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = [
    pkgs.kitty
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
