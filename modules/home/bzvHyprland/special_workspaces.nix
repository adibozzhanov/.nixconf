{lib, config, ...}:
with lib;
{
  wayland.windowManager.hyprland.settings = {

    workspace = [
      "special:terminals, on-created-empty: kitty"
      "special:spotify, on-created-empty: spotify"
      "special:chats, on-created-empty: telegram-desktop & webcord & whatsapp-for-linux"
    ];

    windowrulev2 = [
      "workspace special:terminals, class:^(kitty)$"
      "workspace special:spotify, class:^(Spotify)$"
      "workspace special:chats, class:^(org.telegram.desktop)$"
      "workspace special:chats, class:^(whatsapp-for-linux)$"
      "workspace special:chats, class:^(webcord)$"
      "workspace special:games, class:^(gamescope)$"
      "fullscreen, class:^(gamescope)$"
    ];

    bind = [
      "CTRL, grave, togglespecialworkspace, terminals"
      "$mod, c, togglespecialworkspace, chats"
      "$mod, s, togglespecialworkspace, spotify"
      "$mod, g, togglespecialworkspace, games"
    ];
  };
}
