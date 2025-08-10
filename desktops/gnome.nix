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
    dconf-editor
  ];

  home-manager.users.deweyhinni = {
    dconf = {
      enable = true;
      settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
      settings."org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          pop-shell.extensionUuid
          just-perfection.extensionUuid
          hide-minimized.extensionUuid
        ];
      };

      settings = {
        "org/gnome/desktop/wm/keybindings" = {
          switch-to-workspace-1 = ["<Super>1"];
          switch-to-workspace-2 = ["<Super>2"];
          switch-to-workspace-3 = ["<Super>3"];
          switch-to-workspace-4 = ["<Super>4"];
          switch-to-workspace-5 = ["<Super>5"];
          switch-to-workspace-6 = ["<Super>6"];

          move-to-workspace-1 = ["<Super><Shift>1"];
          move-to-workspace-2 = ["<Super><Shift>2"];
          move-to-workspace-3 = ["<Super><Shift>3"];
          move-to-workspace-4 = ["<Super><Shift>4"];
          move-to-workspace-5 = ["<Super><Shift>5"];
          move-to-workspace-6 = ["<Super><Shift>6"];

          switch-to-workspace-left = ["<Control><Super>h"];
          switch-to-workspace-right = ["<Control><Super>l"];
          switch-to-workspace-down = ["<Control><Super>j"];
          switch-to-workspace-up = ["<Control><Super>k"];

          close = ["<Super>q"];
        };
        "org/gnome/shell/keybindings" = {
          switch-to-application-1 = [];
          switch-to-application-2 = [];
          switch-to-application-3 = [];
          switch-to-application-4 = [];
          switch-to-application-5 = [];
          switch-to-application-6 = [];
          switch-to-application-7 = [];
          switch-to-application-8 = [];
          switch-to-application-9 = [];
          toggle-overview = ["<Super>w"];
        };
        "org/gnome/settings-daemon/plugins/media-keys" = {
          screensaver = ["<Super>Escape"];
        };
        "org/gnome/desktop/input-sources" = {
          xkb-options = ["caps:escape_shifted_capslock"];
        };
      };
    };
  };
}
