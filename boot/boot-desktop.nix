{ config, pkgs, ... }:

{
boot = {

    # Bootloader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;

    initrd.luks.devices."luks-14d0c9f6-f237-4c37-95d1-2f0e0a034279".device = "/dev/disk/by-uuid/14d0c9f6-f237-4c37-95d1-2f0e0a034279";

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
