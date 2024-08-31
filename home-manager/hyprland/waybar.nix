{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
      height = 30;
      layer = "top";
      modules-right = [
        "tray"
        "network"
        "pulseaudio"
        "battery"
      ];
      modules-center = [
        "clock"
      ];
      modules-left = [
        "cpu"        
        "memory"
      ];

      "pulseaudio" = {
        reverse-scrolling = 1;
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
          default = ["" "" ""];
        };
        on-click = "pwvucontrol";
        min-length = 13;
      };

      "network" = {
	      format = "";
	      format-wifi = "";
	      format-ethernet = "";
	      format-disconnected = "";
	      tooltip-format = "{ifname}";
	      tooltip-format-wifi = "{essid} ({signalStrength}%) ";
	      tooltip-format-ethernet = "{ifname} ";
	      tooltip-format-disconnected = "Disconnected";
	      max-length = 5;
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% ";
      };
      
      "cpu" = {
        interval = 2;
        format = "{usage}% ";
        min-length = 6;
        on-click = "gnome-system-monitor";
      };

      "memory" = {
        interval = 2;
        min-length = 6;
        format = "{percentage}% ";
      };

      tray = {
        icon-size = 16;
        spacing = 0;
      };           
    }];

    style =
      ''
* { 
    border: none;
    border-radius: 0;
    font-family: JetBrains Mono;
    font-weight: bold; 
    min-height: 0px;
}

window#waybar {
    background: transparent;
}




#clock, #network, #cpu, #battery, #memory, #pulseaudio, #tray {
    margin-top: 8px;
    padding-left: 16px;
    padding-right: 16px;
    transition: none;
    color: #ffffff;
    min-height: 24px;
    transition-property: background-color;
    transition-duration: .5s;
    background-color: rgba(56, 60, 74, 0.5);
}

#cpu {
    margin-left: 16px;
    border-radius: 10px 0 0 10px;
}

#memory {
    border-radius: 0 10px 10px 0;
}

#battery {
    margin-right: 16px;
}

#clock:hover, #network:hover, #cpu:hover, #battery:hover, #memory:hover, #pulseaudio:hover, #tray:hover {
    background-color: rgba(56, 60, 74, 0.8);
}
      '';   
  };  
}
