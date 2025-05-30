{
  programs.nushell = {
    enable = true;
    shellAliases = {
      rebuild = "nix flake update ; sudo nixos-rebuild switch --flake /home/deweyhinni/nixos-flake-config/#deweyhinni-nixos";
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
