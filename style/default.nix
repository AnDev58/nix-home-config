{ config, pkgs, ... }:
{
  gtk = import ./gtk.nix pkgs;
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    fonts = import ./fonts.nix pkgs;
    cursor = import ./cursor.nix pkgs;

    # Wallpaper that will be set
    image = ../dotfiles/wallpaper.png;
    polarity = "dark";
  };

}
