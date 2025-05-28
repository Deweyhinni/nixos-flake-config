{
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        update = "nix flake update && sudo nixos-rebuild switch --flake /home/deweyhinni/nixos-flake-config/#deweyhinni-nixos";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "rust" "vi-mode" "copyfile" "eza" ];
        theme = "af-magic";
      };
    };
}
