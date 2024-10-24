{ pkgs, ... }:

{
  ## Install Packages
  environment.systemPackages = with pkgs; [
    anydesk
    bottles
    celluloid
    cobra-cli
    #davinci-resolve
    doctl
    gcc
    gh
    gparted
    heroic
    jq
    kget
    mangohud
    motrix
    mpv
    networkmanagerapplet
    ntfs3g
    nwg-look
    pcsx2
    picard
    picard-tools
    qbittorrent
    qpwgraph
    sing-box
    sshuttle
    telegram-desktop
    tldr
    trash-cli
    tree
    uget
    universal-android-debloater
    unrar
    unzip
    ventoy
    vlc
    wget
  ];
}
