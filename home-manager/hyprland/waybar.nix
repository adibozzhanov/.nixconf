{ pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar-hyprland;
    systemd.enable = true;
    settings = [{
      height = 30;
      layer = "top";
      modules-right = [        
        "network"
        "battery"
      ];

      modules-center = [
        "clock"
      ];

      modules-left = [
        "cpu"        
        "memory"
      ];      
    }];
  };  
}
