{ config, lib, inputs, pkgs, ... }:
{
  imports = [
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
      sha256 = "1krclaga358k3swz2n5wbni1b2r7mcxdzr6d7im6b66w3sbpvnb3";
    })
  ];


  xdg.configFile."environment.d/envvars.conf".text = ''
    PATH="$HOME/.nix-profile/bin:$PATH"
  '';

  programs.home-manager.enable = true;

  programs.fish = {
    interactiveShellInit = ''
    # accessia thing
    set -x ACCESSIA_MAIN_REPO '~/Documents/code/accessia/main'
    set -x TF_PLUGIN_CACHE_DIR '/home/adi/terraform_cache'
    set -x TERRAGRUNT_PROVIDER_CACHE 1

    neofetch

    # Created by `pipx` on 2024-08-13 11:54:28
    set PATH $PATH /home/adi/.local/bin
    '';
    shellAliases = {
      cdmain = "cd ~/Documents/code/accessia/main";
      cdmanagement = "cd ~/Documents/code/accessia/management";
      cdmanagementui = "cd ~/Documents/code/accessia/management/clients/web/management_ui";
      cdcloud = "cd ~/Documents/code/accessia/main/clients/web/cloud_ui";
      cdlanding = "cd ~/Documents/code/accessia/management/clients/web/landing_ui";
      cdrest = "cd ~/Documents/code/accessia/main/clients/web/rest_controller_ui";
      cdredux = "cd ~/Documents/code/accessia/web_common/@accessia/api-redux";
      cdhooks = "cd ~/Documents/code/accessia/web_common/@accessia/hooks";
      cdinfra = "cd ~/Documents/code/accessia/cloud-infra-template";
      cdweb = "cd ~/Documents/code/accessia/web_common";
      cdtheme = "cd ~/Documents/code/accessia/web_common/@accessia/mui-theme";
      cdandroid = "cd ~/Documents/code/accessia/android";
      cdreader = "cd ~/Documents/code/accessia/reader";
      cdosdp = "cd ~/Documents/code/accessia/osdp";
      npf = "npm run fresh";
      nps = "npm start";
      npss = "VITE_HOST=$(string split ' ' $(hostname -I) | head -n 1) npm start";
      dcu = "docker compose up";
      dcd = "docker compose up configure_demo";
      did = "docker compose up init_db";
      didcd = "docker compose up init_db; docker compose up configure_demo";
    };
  };

  bzvDesktop = {
    enable = true;
    isUbuntu = true;
  };
  bzv.emacs.enable = true;
  bzvGit.enable = true;
  bzvFish = {
    enable = true;
    withAliases = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    packages = with pkgs; [
      terraform
      terragrunt
      telegram-desktop
      firefox
      webcord
      whatsapp-for-linux
      spotify
      pulseaudioFull
    ];
    username = "adi";
    homeDirectory = "/home/adi";
    file = {
      "screenshots/.keep".source = builtins.toFile "keep" "";
      "code/.keep".source = builtins.toFile "keep" "";
      "videos/.keep".source = builtins.toFile "keep" "";
      "recordings/.keep".source = builtins.toFile "keep" "";
      "wallpapers/.keep".source = builtins.toFile "keep" "";
    };
    stateVersion = "24.05";
  };
}
