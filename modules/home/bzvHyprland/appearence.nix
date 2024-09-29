{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = "5";
      gaps_out = "5";
      border_size = "2";
      "col.active_border" = "rgba(ffffffff)";
      "col.inactive_border" = "rgba(595959aa)";
      resize_on_border = "true";
      layout = "dwindle";
    };

    decoration = {
      rounding = "10";
      active_opacity = "1.0";
      inactive_opacity = "0.8";
      drop_shadow = "true";
      shadow_range = "4";
      shadow_render_power = "3";
      "col.shadow" = "rgba(1a1a1aee)";
      blur = {
        enabled = "true";
        size = "8";
        passes = "1";
        vibrancy = "0.1696";
      };
    };

    animations = {
      enabled = "true";
      bezier = "myBezier, 0.22, 1, 0.36, 1";
      animation = [
        "windows, 1, 5, myBezier"
        "workspaces, 1, 5, default"
        "fade, 1, 7, default"
        "borderangle, 1, 8, default"
        "border, 1, 10, default"
        "windowsOut, 1, 5, default, popin 80%"
      ];
    };

    dwindle = {
      pseudotile = "true";
      preserve_split = "true";
    };

    misc = {
      force_default_wallpaper = "1";
      disable_hyprland_logo = "true";
    };
  };
}
