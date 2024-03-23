{ pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules.nix
      inputs.home-manager.nixosModules.default
      (inputs.hyprland.packages.${pkgs.system}.hyprland.override { legacyRenderer = true; })
    ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ##  Set your time zone.
  time.timeZone = "Asia/Tehran";

  ## Home-manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "winder" = import ../../user/home.nix;
    };
  };

  # Define a user account.
  users.users.winder = {
    isNormalUser = true;
    extraGroups = [ "wheel" "adbusers" ];
  };

  ## System
  system = {
    stateVersion = "unstable";
  };
}