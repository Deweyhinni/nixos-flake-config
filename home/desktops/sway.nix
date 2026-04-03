{ config, pkgs, ... }:
let
  wallpaper = ./../wallpapers/Xenia.png;
in {
  imports = [
    ./waybar.nix
    ./wofi.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    systemd.variables = ["--all"];
    config = rec {
      modifier = "Mod4";
      terminal = "ghostty";
      menu = "wofi --show run";
      bars = [{
        command = "waybar";
      }];
      startup = [
        { command = "${pkgs.swaybg}/bin/swaybg -i ${wallpaper} -m fill"; }
      ];

      input = {
        "type:keyboard" = {
          xkb_layout = "us,is";
          xkb_options = "grp:win_space_toggle,caps:escape";
        };
      };
    };

    extraConfig = ''
      set $rosewater #f2d5cf
      set $flamingo #eebebe
      set $pink #f4b8e4
      set $mauve #ca9ee6
      set $red #e78284
      set $maroon #ea999c
      set $peach #ef9f76
      set $yellow #e5c890
      set $green #a6d189
      set $teal #81c8be
      set $sky #99d1db
      set $sapphire #85c1dc
      set $blue #8caaee
      set $lavender #babbf1
      set $text #c6d0f5
      set $subtext1 #b5bfe2
      set $subtext0 #a5adce
      set $overlay2 #949cbb
      set $overlay1 #838ba7
      set $overlay0 #737994
      set $surface2 #626880
      set $surface1 #51576d
      set $surface0 #414559
      set $base #303446
      set $mantle #292c3c
      set $crust #232634

      gaps inner 3
      gaps outer 3

      # target                 title     bg    text   indicator  border
      client.focused           $lavender $base $text  $rosewater $pink
      client.focused_inactive  $overlay0 $base $text  $rosewater $overlay0
      client.unfocused         $overlay0 $base $text  $rosewater $overlay0
      client.urgent            $peach    $base $peach $overlay0  $peach
      client.placeholder       $overlay0 $base $text  $overlay0  $overlay0
      client.background        $base

      default_border pixel 3
      shadows enable
      corner_radius 11
      blur_radius 7
      blur_passes 2

      bindsym Mod4+Ctrl+h workspace prev
      bindsym Mod4+Ctrl+l workspace next
      bindsym Mod4+Ctrl+Shift+h move container to workspace prev; workspace prev
      bindsym Mod4+Ctrl+Shift+l move container to workspace next; workspace next

      bindsym XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      bindsym XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindsym XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindsym XF86AudioMicMute exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bindsym XF86AudioPlay exec playerctl play-pause
    '';
  };
}
