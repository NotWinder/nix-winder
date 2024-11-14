{
  inputs,
  osConfig,
  pkgs,
  lib,
  ...
}: let
  inherit (builtins) map;
  inherit (lib.modules) mkIf;
  inherit (lib.meta) getExe;
  inherit (lib.strings) concatStringsSep;

  inherit (osConfig) modules;
  env = modules.usrEnv;
  sys = modules.system;

  monitors = modules.device.monitors;

  hyprpaper = inputs.hyprpaper.packages.${pkgs.stdenv.system}.default;
  #wallpkgs = inputs.wallpkgs.packages.${pkgs.stdenv.system};
in {
  config = mkIf ((sys.video.enable) && (osConfig.meta.isWayland && (env.desktop == "Hyprland"))) {
    systemd.user.services.hyprpaper = lib.mkHyprlandService {
      Unit.Description = "Hyprland wallpaper daemon";
      Service = {
        Type = "simple";
        ExecStart = "${getExe hyprpaper}";
        Restart = "on-failure";
      };
    };
    xdg.configFile."hypr/hyprpaper.conf" = {
      text = let
        wallpaper = "/home/winder/.config/hypr/.wallpapers/IRRATIONAL-TREASURE-2-THE-TREMBLEY-SUPREMACY.png";
      in ''
        preload=${wallpaper}
        ${concatStringsSep "\n" (map (monitor: ''wallpaper=${monitor},${wallpaper}'') monitors)}
        ipc=off
      '';
    };
  };
}
