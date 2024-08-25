{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
      height = 30;
      layer = "top";
      modules-right = [
        "battery"
        "network"        
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
