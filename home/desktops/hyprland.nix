{ config, ... }:
{
  programs.kitty.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    xwayland.enable = true;
    withUWSM = true;

    systemd.variables = ["--all"];
  };

  programs.waybar = {
    enable = true;
  };
}
