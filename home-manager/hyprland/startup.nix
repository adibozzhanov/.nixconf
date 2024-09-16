{
  wayland.windowManager.hyprland.settings = {
    env = [
      "XDG_CURRENT_DESKTOP,Hyprland"
    ];
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "dbus-update-activation-environment --systemd --all"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "swaync"
      "nm-applet"
      "systemctl --user start plasma-polkit-agent"
      "chmod +x ~/.nixconf/home-manager/scripts/*"
      "~/.nixconf/home-manager/scripts/wallpaper.sh"
    ];
  };
}
