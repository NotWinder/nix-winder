{ inputs, pkgs, ... }: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    brightnessctl
    bun
    dart-sass
    fd
    gtk3
    inputs.hyprpaper.packages.${system}.default
    inputs.hyprpicker.packages.${system}.default
    inputs.matugen.packages.${system}.default
    networkmanager
    pavucontrol
    slurp
    swappy
    swww
    wayshot
    wf-recorder
    wl-clipboard
  ];

  programs.ags = {
    enable = true;
    configDir = ./config;
    # extraPackages = with pkgs; [
    #   accountsservice
    # ];
  };
}
