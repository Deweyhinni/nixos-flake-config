{
  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "transgender";
      mode = "rgb";
      auto_detect_light_dark = true;
      light_dark = "dark";
      lightness = 0.6;
      color_align = {
          mode = "custom";
          custom_colors = {
              "1" = 1;
              "2" = 0;
          };
      };
      backend = "fastfetch";
      pride_month_disable = false;
    };
  };
}
