{ config
, pkgs
, ...
}: {
  ##  Networking

  imports = [
    ./ssh.nix
    ./tailscale.nix
  ];

  #networking.interfaces.enp5s0.wakeOnLan.enable = true;

  networking = {
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-l2tp
      ];
    };
    hostId = builtins.substring 0 8 (builtins.hashString "md5" config.networking.hostName);
    firewall.enable = false;
  };

  environment.etc."strongswan.conf".text = ''
    charon {
      load_modular = no
      load = aes gmp kdf kernel-netlink nonce random resolve socket-default stroke x509 pubkey pem pkcs1 hmac xcbc drbg sha1 sha2 md5 fips-prf
    }
  '';

  systemd.services.NetworkManager.environment = {
    STRONGSWAN_CONF = "/etc/strongswan.conf";
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    networkmanager-openvpn
    openvpn
  ];
}
