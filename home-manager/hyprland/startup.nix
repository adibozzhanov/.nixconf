{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waypaper --restore"
      "swaync"
      "systemctl --user start plasma-polkit-agent"
      "chmod +x ~/.nixconf/home-manager/scripts/*"
      "xrandr --output $primaryMon --primary"
    ];    
  };
}
