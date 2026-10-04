{ config, pkgs, ... }:
let
  lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
  display = status: "${pkgs.swayfx}/bin/swaymsg 'output * power ${status}'";
in {
  services.swayidle = {
    enable = true;
    events = {
      before-sleep = (display "off") + "; " + lock;
      after-resume = display "on";
    };
  };
}
