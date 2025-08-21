{
  programs.nushell = {
    enable = true;
    shellAliases = {
      update = "nix flake update";
      rebuild = "sudo nixos-rebuild switch --flake /home/deweyhinni/nixos-flake-config/#$env.NIXOS_CURRENT_CONFIG_NAME";
      nixdev = "nix develop -c $env.SHELL";
      ls = "eza";
      find = "fd";
    };
    extraConfig = ''
      mkdir ($nu.data-dir | path join "vendor/autoload")
      starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

      $env.config.edit_mode = 'vi'

      $env.config = {
        cursor_shape: {
          emacs: line
          vi_insert: line
          vi_normal: block
        }
      }
    '';
  };
}
