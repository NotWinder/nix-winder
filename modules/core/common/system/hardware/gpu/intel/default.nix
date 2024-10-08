{ pkgs, ... }:
{
  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        #intel-vaapi-driver
        libvdpau-va-gl
      ];
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
