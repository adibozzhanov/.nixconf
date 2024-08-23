{ pkgs, ... } :

{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod SHIFT, O, exec, kitty"
    ];
  };
}
