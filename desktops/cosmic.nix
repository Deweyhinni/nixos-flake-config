{ config, pkgs, ... }:
{
  services = {
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;

    # xserver.inputClassSections = [
    #   ''
    #     Identifier "Wacom Intuos BT M Pen"
    #     MatchUSBID "0x56a:0x3c7"
    #     MatchDevicePath "/dev/input/event*"
    #     MatchIsTablet "on"
    #     Driver "wacom"
    #   ''
    #   ''
    #     Identifier "Wacom Intuos BT M Pad"
    #     MatchUSBID "0x56a:0x3c7"
    #     MatchDevicePath "/dev/input/event*"
    #     MatchIsKeyboard "on"
    #     Driver "libinput"
    #   ''
    # ];
  };

  hardware.opentabletdriver.enable = true;

  environment.systemPackages = with pkgs; [
    opentabletdriver
    loupe
    libwacom
  ];
}
