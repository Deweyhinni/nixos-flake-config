{
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        rebuild = "nix flake update && sudo nixos-rebuild switch --flake /home/deweyhinni/nixos-flake-config/#deweyhinni-nixos";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "rust" "vi-mode" "copyfile" "eza" ];
        theme = "af-magic";
      };
      # initContent = ''
      #   type starship_zle-keymap-select >/dev/null || \
      #   {
      #     echo "Load starship"
      #     eval "$(starship init zsh)"
      #   }
      # '';
    };
}
