{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    nixvim.url = "github:nix-community/nixvim";

    # Downgrading xwayland-satellite because 0.8.2 introduces a lot of issues, mainly:
    # https://github.com/Supreeeme/xwayland-satellite/issues/470 - DaVinci Resolve crash.
    # https://github.com/Supreeeme/xwayland-satellite/issues/468 - Steam not rendering popups properly.
    nixpkgs-xwayland-satellite-0-8-1.url = "github:nixos/nixpkgs/edfd59b795cd752c36d2dae60870cffcd23d3fb1";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
