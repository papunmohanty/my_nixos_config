{ config, pkgs, ...  }:

{
  home.username = "pmo";
  home.homeDirectory = "/home/pmo";
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use hyprland on nixos btw";
    };
    profileExtra = ''
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';
    initExtra = ''
      if [[ $- == *i* ]]; then
        fastfetch
      fi
    '';
  };
  home.file.".config/hypr".source = ./config/hypr;

  services.hyprpaper = {
  enable = true;
  settings = {
    preload = [
      "~/wallpapers/wallpaper2.jpg"
      "~/wallpapers/wallpaper.jpg"
    ];
    wallpaper = [
      # By display
      # {
      #   monitor = "DP-2";
      #   path = "~/wallpapers/wallpaper2.jpg";
      # }
      # By default/fallback
      {
        monitor = "";
        path = "~/wallpapers/wallpaper1.jpg";
      }
    ];
  };
};
}
