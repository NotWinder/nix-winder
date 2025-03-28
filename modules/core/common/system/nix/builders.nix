{
  config,
  lib,
  ...
}: let
  inherit (lib.attrsets) recursiveUpdate;
  inherit (lib.lists) filter;

  sys = config.modules.system;
  # a generic builder configuration
  builder = {
    systems = ["x86_64-linux"];
    speedFactor = 4;
    maxJobs = 4;
    supportedFeatures = ["benchmark" "nixos-test"];
    sshKey = "${sys.homePath}/.ssh/builder";
    protocol = "ssh-ng";
  };

  # Override generic builder config with extra configuration options
  # and resources, assuming the machine marked as such can adapt to
  # them.
  bigBuilder = recursiveUpdate builder {
    maxJobs = 16;
    speedFactor = 16;
    supportedFeatures = builder.supportedFeatures ++ ["kvm" "big-parallel"];
    systems = builder.systems ++ ["aarch64-linux" "i686-linux"];
  };

  mkBuilder = {
    builderBase ? builder,
    sshProtocol ? "ssh-ng",
    user ? "root",
    host,
    ...
  }:
    recursiveUpdate builderBase {
      hostName = host;
      sshUser = user;
      protocol = sshProtocol;
    };
in {
  nix = {
    distributedBuilds = true;
    buildMachines = filter (builder: builder.hostName != config.networking.hostName) [
      # large build machine
      (mkBuilder {
        builderBase = bigBuilder;
        user = "builder";
        host = "build.neushore.dev";
        sshProtocol = "ssh"; # ssh-ng is not supported by this device
      })
    ];
  };
}
