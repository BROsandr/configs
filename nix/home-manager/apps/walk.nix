{ pkgs, ... }:
{
  programs.fish.functions.lk = ''set loc (walk --icons $argv); and cd $loc;'';

  home.packages = with pkgs; [ walk ];
}
