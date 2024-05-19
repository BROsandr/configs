{ pkgs, ...}: {
  home.packages = with pkgs; [ speedtest-cli ];

  home.shellAliases.speedtest-cli = "speedtest-cli --secure --byte";
}
