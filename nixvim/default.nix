{ pkgs, config, ... }: 
  let
    allPlugins = import ./plugins.nix pkgs;
    nativePlugins = allPlugins.native;
    extraPlugins = allPlugins.extras;
  in {
    programs.nixvim = {
      enable = true;

      # Make Nixvim default editor
      defaultEditor = true;

      # Import native Neovim options
      opts = import ./options.nix;

      # Set mapleader
      globals.mapleader = " ";

      # Design commentaries to make them easier to read
      highlight.Comment = {
        underline = true;
        bold = true;
      };

      # Enable system clipboard support (wl-copy for Wayland, xclip for X11)
      clipboard = {
        register = "unnamedplus";
        providers = {
          wl-copy.enable = true;
          xclip.enable = true;
        };
      };

      # Import all special keymaps (AKA plugin keymaps)
      keymaps = import ./keymaps.nix;

      # Install plugins
      plugins = nativePlugins;
      extraPlugins = extraPlugins;
    };
  }
