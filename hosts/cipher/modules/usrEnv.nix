{
  config.modules.usrEnv = {
    desktop = "Hyprland";
    desktops."i3".enable = true;
    useHomeManager = true;

    programs = {
      media = {
        beets.enable = true;
        mpv.enable = true;
        ncmpcpp.enable = true;
      };

      browser = {
        zen.enable = true;
        chromium.enable = true;
      };

      launchers = {
        anyrun.enable = true;
        tofi.enable = true;
      };

      screenlock.swaylock.enable = true;
    };
    services.media.mpd.enable = true;
  };
}
