{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "waypaper --restore"
      "swaync"
      "systemctl --user start plasma-polkit-agent"
    ];    
  };
}
