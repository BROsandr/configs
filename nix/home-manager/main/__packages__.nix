{pkgs, ...} :
let
  wordEnv = pkgs.buildEnv {
    paths = with pkgs; [
      python3Packages.docx2txt
    ];
    name = "wordEnv";
  };
in {
  home.packages = with pkgs; [
    wget
    wordEnv
  ];
}
