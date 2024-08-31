{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "swaync"
      "nm-applet"
      "systemctl --user start plasma-polkit-agent"
      "chmod +x ~/.nixconf/home-manager/scripts/*"
      "~/.nixconf/home-manager/scripts/wallpaper.sh"
    ];    
  };
}
