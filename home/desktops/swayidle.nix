{ config, pkgs, ... }:
let
  lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
  display = status: "${pkgs.swayfx}/bin/swaymsg 'output * power ${status}'";
in {
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = (display "off") + "; " + lock;
      }
      {
        event = "after-resume";
        command = display "on";
      }
    ];
  };
}
