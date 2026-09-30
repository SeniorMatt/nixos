{ self, ... }:
{
  flake.nixosModules.gamedev = { pkgs, ... }: {
    imports = [
      self.nixosModules.aseprite
      self.nixosModules.git
      self.nixosModules.nvim
      self.nixosModules.tmux
    ];

    environment.systemPackages = with pkgs; [
      (bottles.override { removeWarningPopup = true; })
      (godot-mono.overrideAttrs { dotnet-sdk = dotnetCorePackages.sdk_8_0-bin; })
      audacity
      blender
      dotnet-sdk
      godot-mono
      steam-run
      tree
      unityhub
    ];
  };
}
