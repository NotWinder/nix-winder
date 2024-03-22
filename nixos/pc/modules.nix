{
  imports =
    [
      ../modules/audio.nix
      ../modules/bootloader/uefi.nix
      ../modules/fonts.nix
      ../modules/jellyfin.nix
      ../modules/networking.nix
      ../modules/nvidia.nix
      ../modules/packages/development.nix
      ../modules/packages/others.nix
      ../modules/services.nix
      ../modules/wm/display-manager.nix
      ../modules/wm/hyprland.nix
      ../modules/wm/polkit.nix
      ../modules/wm/thunar.nix
      ../modules/wm/xserver.nix
      ../modules/zfs.nix
    ];
}
