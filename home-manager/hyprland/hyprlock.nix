{ pkgs, ... }:
{
  programs.hyprlock = with pkgs; {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 4;
          blur_size = 5;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          shadow_passes = 2;
        }
      ];
    };
  };
}