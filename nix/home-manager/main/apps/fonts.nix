{ pkgs, ... }: {
  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "JetBrainsMonoNL Nerd Font" ];
  };
  home.packages  = with pkgs; [
    nerdfonts
    font-awesome
  ];
}
