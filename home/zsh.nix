{
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake /home/deweyhinni/nixos-flake-config/#$NIXOS_CURRENT_CONFIG_NAME";
        update = "nix flake update";
        nixdev = "nix develop -c $SHELL";
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
