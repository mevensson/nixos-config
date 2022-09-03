{ config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "ehci_pci" "xhci_pci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7f5f422d-517d-408a-b536-2b92472bcf60";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/CE9E-3512";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/7f5f422d-517d-408a-b536-2b92472bcf60";
    fsType = "btrfs";
    options = [ "subvol=@home" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/c3229762-abc3-410e-89ea-a6feb220d038"; }
  ];
}
