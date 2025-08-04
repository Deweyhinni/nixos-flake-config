{ config, pkgs, ... }:
{
  services = {
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
  };

  environment.systemPackages = with pkgs; [
    opentabletdriver
  ];
}
