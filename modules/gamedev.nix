{ self, ... }:
{
  flake.nixosModules.gamedev = { pkgs, ... }: {
    imports = [ 
      self.nixosModules.git
      self.nixosModules.neovim 
      self.nixosModules.tmux
    ];
    
    environment.systemPackages = with pkgs; [
      (bottles.override { removeWarningPopup = true; })
      aseprite
      dotnet-sdk
      gnome-clocks
      godot-mono
      steam-run
      tree
      unityhub
    ];
  };
}
