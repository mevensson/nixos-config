{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    #gnomeExtensions.arcmenu
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.custom-hot-corners-extended
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dash-to-panel
    gnomeExtensions.espresso
    gnomeExtensions.extension-list
    gnomeExtensions.just-perfection
    gnomeExtensions.net-speed-simplified
    gnomeExtensions.openweather
    gnomeExtensions.screenshot-tool
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.tiling-assistant
    gnomeExtensions.vitals
    gnomeExtensions.weather-in-the-clock
    firefox
    variety
  ];

  boot.plymouth.enable = true;

  fonts.fonts = with pkgs; [
    corefonts
    fira-code
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  services = {
    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      layout = "se";

      # Enable touchpad support.
      libinput = {
        enable = true;
      };

      # Enable the GNOME Desktop Environment.
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager.gnome = {
        enable = true;
      };
    };
  };
}
