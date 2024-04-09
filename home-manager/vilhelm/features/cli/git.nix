{ ... }:

{
  programs.git = {
    enable = true;
    userName = "vilhelm";
    userEmail = "vilhelm.lindell123@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };
}
