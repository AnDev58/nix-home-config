{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableBashIntegration = true;
  };

}
