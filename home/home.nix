{ config, pkgs, inputs, system, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./nu.nix
    ./starship.nix
    ./flatpak.nix
    ./hyfetch.nix
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "deweyhinni";
  home.homeDirectory = "/home/deweyhinni";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    htop
    fastfetch
    hyfetch
    ripgrep
    steam
    gh
    tree
    rustup
    bat
    eza
    gitui
    freecad
    blender-hip
    godot
    spotify
    ncspot
    discord
    kicad
    # jellyfin-media-player
    prismlauncher
    openjdk21
    jetbrains.idea-community-bin
    # orca-slicer
    # alvr
    mpv
    vlc
    qbittorrent
    mission-center
    tuba
    anki
    starship
    python3
    rnote
    viu
    haskell.compiler.ghc98
    intiface-central
    tokei
    localsend
    wgnord
    libreoffice
    ocaml
    texliveFull
    zathura
    unzip
    tracy
    fritzing
    arduino-ide
    typst


    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ] ++ [
    inputs.nixvim-config.packages.${system}.default
  ];

  xdg.desktopEntries = {
    firefox-school = {
      name = "Firefox School";
      genericName = "Web Browser";
      exec = "firefox -p School --name firefox-school %U";
      terminal = false;
      categories = [ "Application" "Network" "WebBrowser" ];
      mimeType = [ "text/html" "text/xml" ];
      icon = "firefox";
      type = "Application";
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    # doesn't really work since mason breaks on nixos lmao
    # ".config/nvim".source = pkgs.fetchFromGitHub {
    #   owner = "deweyhinni";
    #   repo = "kickstart.nvim";
    #   rev = "e053129";
    #   sha256 = "gduD7tZP5TLZ82EPriX58ZWaPtA1D+ozWYZETM+hk+g=";
    # };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/deweyhinni/etc/profile.d/hm-session-vars.sh
  #
  systemd.user.sessionVariables = {
    EDITOR = "nvim";
    VI_MODE_SET_CURSOR = "true";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
