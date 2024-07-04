terminal: fileManager: menu: 
[
  "$mod Shift, Return, exec, ${terminal}"
	"$mod Shift, Q, exit,"
	"$mod, P, exec, ${menu}"
	"$mod, J, layoutmsg, cyclenext"
	"$mod, K, layoutmsg, cycleprev"
	"$mod, I, layoutmsg, addmaster"
	"$mod, D, layoutmsg, removemaster"
	"$mod, H, layoutmsg, mfact -0.05"
	"$mod, L, layoutmsg, mfact +0.05"
	"$mod, Return, layoutmsg, swapwithmaster"
  "$mod, Tab, cyclenext, tiled"
	"$mod Shift, C, killactive"
  "$mod SHIFT, Space, togglefloating, active"
	"$mod, S, togglespecialworkspace, magic"
	"$mod SHIFT, S, movetoworkspace, special:magic"
	"$mod, E, exec, ${fileManager}"
] 
++
(
  # Workspaces
  builtins.concatLists (
    builtins.genList (
      x: let
        ws = let
	        c = (x + 1) / 10;
	      in
	        builtins.toString (x + 1 - (c * 10));
	    in [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
	      "$mod Shift, ${ws}, movetoworkspace, ${toString (x + 1)}"
	    ]
    ) 10
  )
)
