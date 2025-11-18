{
  programs.git = {
    enable = true;
    settings = {
      user.name = "deweyhinni";
      user.email = "deweyhinni@protonmail.com";
    };
    
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
