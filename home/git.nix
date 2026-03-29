{
  programs.git = {
    enable = true;
    settings = {
      user.name = "deweyhinni";
      user.email = "deweyhinni@protonmail.com";
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
}
