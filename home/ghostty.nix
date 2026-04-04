{ config, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      theme = "Catppuccin Frappe";
      background-opacity = 0.95;
      background-blur = 15;
    };
  };
}
