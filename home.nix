{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./nixvim
    ./firefox
    ./kitty
    ./git
    ./hyprland
    ./style
    ./go
  ];

  # Basic configuration
  home = {
    username = "andev";
    homeDirectory = "/home/andev";

    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.05";

    # Copy files to `~`
    file = {
      ".bg/wallpaper.png".source = ./dotfiles/wallpaper.png;
    };
  };
  # Copy configuration to ~/.config
  xdg.configFile = {
    "hypr/hyprpaper.conf".source = ./dotfiles/hyprpaper.conf;
  };

  # Set environmental variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Install packages
  nixpkgs.config.allowUnfree = true; # Allow unfree software before installing
  home.packages = import ./install.nix pkgs;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable all variables in Bash
  programs.bash.enable = true;

  # Start keyring service for apps like VS Code
  services.gnome-keyring.enable = true;
}
