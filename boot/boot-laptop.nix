{ config, pkgs, ... }:

{
  boot = {
    # Bootloader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    loader.systemd-boot.configurationLimit = 10;

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;

    initrd.luks.devices."luks-580536d9-0ba4-434a-b3e6-039852becc69".device = "/dev/disk/by-uuid/580536d9-0ba4-434a-b3e6-039852becc69";

    initrd.kernelModules = [ "amdgpu" ];

    initrd.availableKernelModules = [ "amdgpu" ];

    initrd.systemd.enable = true;

    plymouth = {
      enable = true;
      theme = "circle";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes)
      ];
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];

    loader.timeout = 0;
  };
}
