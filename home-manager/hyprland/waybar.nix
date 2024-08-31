{
  programs.waybar = {
    enable = true;
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

    style =
      ''
* {
    border: none;
    border-radius: 0;
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: JetBrains Mono;
    font-weight: bold; 
    min-height: 20px;
}

window#waybar {
    background: transparent;
}
      '';   
  };  
}
