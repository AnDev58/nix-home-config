{config, pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName = "AnDev 58";
    userEmail = "andev58@outlook.com";
    diff-so-fancy.enable = true;
    ignores = [
      "dist/*"
      "a.out"
      "*.swp"
    ];

    aliases = {
      ci = "commit";
      cl = "clone";
      co = "checkout";
      purr = "pull --rebase";
      dlog = "!f() { GIT_EXTERNAL_DIFF=difft git log -p --ext-diff $@; }; f";
      dshow = "!f() { GIT_EXTERNAL_DIFF=difft git show --ext-diff $@; }; f";
      fucked = "reset --hard";
      graph  = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };

    extraConfig = {
      pull.rebase = false;
      init.defaultBranch = "master";
    };

  };
}
