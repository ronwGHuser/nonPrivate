{ config, lib, pkgs, ... }:

{
  imports = [ <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>
              ./phpfpm.nix
            ];

  # Let demo build as a trusted user.
 nix.settings.trusted-users = [ "demo" ];


# By default, the NixOS VirtualBox demo image includes SDDM and Plasma.
# If you prefer another desktop manager or display manager, you may want
# to disable the default.
# services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
# services.xserver.displayManager.sddm.enable = lib.mkForce false;

# Enable GDM/GNOME by uncommenting above two lines and two lines below.
# services.xserver.displayManager.gdm.enable = true;
# services.xserver.desktopManager.gnome.enable = true;

# Set your time zone.
time.timeZone = "America/Denver";

# List packages installed in system profile. To search, run:
# \$ nix search wget
environment.systemPackages = with pkgs; [
  git
  wget
  vim
  openssh
  static-web-server
  php
];


services.mysql.package = pkgs.mariadb;
services.mysql.enable = true;


# Enable the OpenSSH daemon.
services.openssh = {
  enable = true;
  passwordAuthentication = true;
};
networking.hostName = "server-demo";
networking.firewall.allowedTCPPorts = [ 22 80 443 ];
networking.useDHCP = true;
networking.interfaces.enp1s0.useDHCP = true;


systemd.tmpfiles.rules = [
  "d /srv/http 0755 root root -"
#  "d /var/www/html 0755 root root -"
#  "d /var/www/html/php 0755 root root -"
  ];


###
# Add my user
# used root user to set the password, figure out how to
# set default password
###
users.users.waltmanr = {
  createHome = true;
  isNormalUser  = true;
  home  = "/home/waltmanr";
  description  = "Ron Waltman";
  extraGroups  = [ "wheel"
                   "networkmanager"
                 ];
  openssh.authorizedKeys.keys  = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIkUFnr2nYIUNrth6J9uJ9vvlZoCPmhK7OQ8RzBEXou4 ronaldwaltman01@gmail.com" ];
};


}
