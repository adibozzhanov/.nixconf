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
        "temperature"
      ];      
    }];

    "cpu" = {
      interval = 2;
      format = "{usage}% ";
      min-length = 6;
    };

    "temperature" = {
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = ["" "" "" "" ""];
        tooltip = false;
    };


    style =
      ''
* {
    border: none;
    border-radius: 0;
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: JetBrains Mono;
    font-weight: bold; 
    min-height: 0px;
}

window#waybar {
    background: transparent;
}

#clock, #network, #cpu, #battery, #memory {
    margin-top: 8px;
    margin-left: 4px;
    margin-right: 4px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    min-height: 24px;
    transition-property: background-color;
    transition-duration: .5s;
    background-color: rgba(56, 60, 74, 0.5);
}
#clock:hover, #network:hover, #cpu:hover, #battery:hover, #memory:hover {
    background-color: rgba(56, 60, 74, 0.8);
}
      '';   
  };  
}
