{ ... }:
{
  system.autoUpgrade = {
    enable = true;
    flake = "github:mevensson/nixos-config";
    dates = "weekly";
    persistent = true;
    randomizedDelaySec = "1h";
  };
}
