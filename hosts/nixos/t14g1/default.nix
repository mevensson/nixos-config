{ suites, config, pkgs, ... }:
{
  imports = suites.desktop ++ [
    ./hardware.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  system.stateVersion = "21.05"; # Did you read the comment?
}
