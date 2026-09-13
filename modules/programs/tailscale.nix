{ self, ... }:
{
  flake.nixosModules.tailscale = { pkgs, ... }:
  {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "client";
      extraSetFlags = [ "--operator=${self.user}" ];
    };
  };
}
