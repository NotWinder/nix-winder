{
  description = "NXA (Nix Automata)";

  inputs = {
    systems.url = "github:nix-systems/default-linux";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    hyprland.url = "github:/hyprwm/Hyprland";

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs = {
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };

    hyprpicker.url = "github:hyprwm/hyprpicker";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # anyrun program launcher
    anyrun.url = "github:anyrun-org/anyrun";
    anyrun-nixos-options = {
      url = "github:n3oney/anyrun-nixos-options";
      inputs = {
        flake-parts.follows = "flake-parts";
      };
    };

    # Personal collection of packages and modules
    # that are too unstable or too personal for nyxexprs.
    nyxexprs = {
      url = "github:NotAShelf/nyxexprs";
      inputs.systems.follows = "systems";
    };

    # Impermanence
    # doesn't offer much above properly used symlinks
    # but it *is* convenient
    impermanence.url = "github:nix-community/impermanence";

    winpaper = {
      url = "github:notwinder/winpaper";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      imports = [
        ./hosts
        ./parts
      ];
    };
}
