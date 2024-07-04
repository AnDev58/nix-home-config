{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = 
    let
      terminal = "kitty";
      fileManager = "thunar";
      menu = "xfce4-appfinder";
    in 
    {
      exec-once = import ./autostart.nix;

      # Set modkey (main key for all binds)
      "$mod" = "SUPER";

      # General config
      general = import ./basics.nix;

      # Configure compositor
      decoration = import ./effects.nix;
      
      # Keyboard layout
      input = {
        kb_layout = "us,ru";
	      kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
      };

      # Import all bindings
      bind = import ./binds.nix terminal fileManager menu;
      
      # Enable Mouse1 & Mouse2
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # Window rules
      windowrulev2 = import ./rules.nix;
    };
  };

}
