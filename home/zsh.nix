{ config, ... }:
{
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        update = "nix flake update";
        nixdev = "nix develop -c $SHELL";
        find = "fd";
        bt = "bluetuith";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "rust" "vi-mode" "copyfile" "eza" ];
        theme = "af-magic";
      };

      initContent = ''
        function rebuild() {
          local op=''${1:-switch}
          sudo nixos-rebuild $op --flake ${config.home.homeDirectory}/nixos-flake-config/#$NIXOS_CURRENT_CONFIG_NAME
        }
      '';
    };
}
