# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  lib,
  pkgs,
  ...
}: {
  boot.initrd.availableKernelModules = ["xhci_pci" "virtio_scsi" "sr_mod"];
  boot.initrd.kernelModules = ["virtio_gpu"];
  boot.kernelModules = [];
  boot.extraModulePackages = [];
  boot.kernelParams = ["console=tty"];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/51ecac7d-62e3-49b9-8e9d-ab30fdf35427";
    fsType = "ext4";
  };

  boot.initrd = {
    luks.devices."root".device = "/dev/disk/by-uuid/0861c9c3-b346-4227-b993-b1ba99064339";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-partlabel/disk-sda-boot";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [
    {device = "/dev/disk/by-partlabel/disk-sda-swap";}
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      editor = false;
    };
  };

  #networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
