{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    plugins = with pkgs; [
      # tmuxPlugins.cpu
    ];
    shell = "${pkgs.fish}/bin/fish";
    terminal = "screen-256color";
  };
}
