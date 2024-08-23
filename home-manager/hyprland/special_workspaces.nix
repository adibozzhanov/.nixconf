{
  workspace = [
    "special:terminals, on-created-empty: kitty"
    "special:chats, on-created-empty: telegram-desktop"
  ];
  
  windowrulev2 = [
    "workspace special:terminals, class:^(kitty)$"
    "workspace special:chats, class:^(org.telegram.desktop)$"
  ];

  bind = [
    "CTRL, grave, togglespecialworkspace, terminals"
    "$mod, c, togglespecialworkspace, chats"      
  ];
}
