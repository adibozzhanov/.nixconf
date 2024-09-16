{ config, pkgs, ... }:
{

  nixpkgs.overlays = [
    (final: prev: {
    rofi-calc = prev.rofi-calc.override { rofi-unwrapped = prev.rofi-wayland-unwrapped; };
    })
  ];
  home.packages = with pkgs; [
    rofi-power-menu
  ];
  programs.rofi = with pkgs; {
    enable = true;
    package = rofi-wayland;
    plugins = [
      rofi-calc
      rofi-power-menu
    ];
    theme = ./rounded-common.rasi;
    extraConfig = {
      show-icons = true;
      sort = true;
      matching = "fuzzy";
    };
  };
}
