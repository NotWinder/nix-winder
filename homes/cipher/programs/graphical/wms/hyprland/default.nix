{
  inputs',
  osConfig,
  pkgs,
  lib,
  ...
}: let
  inherit (builtins) filter map toString;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.modules) mkIf;
  inherit (lib.strings) hasSuffix;
  inherit (osConfig) modules;

  inherit (import ./packages {inherit inputs' pkgs;}) grimblast hyprshot dbus-hyprland-env hyprpicker;

  env = modules.usrEnv;
in {
  imports = filter (hasSuffix ".nix") (
    map toString (filter (p: p != ./default.nix) (listFilesRecursive ./config))
  );
  config = mkIf env.desktops.hyprland.enable {
    home.packages = [
      hyprshot
      grimblast
      hyprpicker
      dbus-hyprland-env
      #pkgs.nwg-displays
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      package = env.desktops.hyprland.package;
      xwayland.enable = true;
      systemd = {
        enable = true;
        variables = ["--all"];
      };

      settings = {
        source = [
          "~/.config/hypr/monitors.conf"
          "~/.config/hypr/workspaces.conf"
        ];
      };
    };
  };
}
