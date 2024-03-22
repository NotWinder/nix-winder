{
  services = {
    gvfs.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    accounts-daemon.enable = true;

    openssh.enable = true;

    ## Sing-box
    sing-box.enable = true;

    ## Resolved
    resolved.enable = true;

    ## Flatpak
    flatpak.enable = true;
  };
}
