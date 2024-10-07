{lib, config, ...}:
let
  isUbuntu = config.bzvHyprland.isUbuntu;
in
with lib;
{
  wayland.windowManager.hyprland.settings = {
    env = [
      "XDG_CURRENT_DESKTOP,Hyprland"
    ] ++ (if !isUbuntu then [] else ["XDG_DATA_DIRS,/home/adi/.nix-profile/share:$XDG_DATA_DIRS"]);
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "dbus-update-activation-environment --systemd --all"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "swaync"
      "nm-applet"
      "systemctl --user start plasma-polkit-agent"
      "chmod +x ~/.nixconf/scripts/*"
      "~/.nixconf/scripts/wallpaper.sh"
    ];
  };
}
