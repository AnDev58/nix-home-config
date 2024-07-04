pkgs: {
  monospace = {
    package = pkgs.nerdfonts.override {fonts = ["UbuntuMono"];};
    name = "UbuntuMono Nerd Font Mono";
  };
  sansSerif = {
    package = pkgs.ubuntu_font_family;
    name = "Ubuntu";
  };
  serif = {
    package = pkgs.liberation_ttf;
    name = "Liberation Serif";
  };

  sizes = {
    applications = 12;
    terminal = 15;
    desktop = 10;
    popups = 10;
  };
}

