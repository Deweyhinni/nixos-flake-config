{config, pkgs, lib, user, ...}:
{
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
    waybar

  ];

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "sway";
        user = "${user}";
      };
    };
  };
}
