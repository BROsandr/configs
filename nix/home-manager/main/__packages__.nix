{pkgs, ...} : {
  home.packages = with pkgs; [
    wget
    python3Packages.docx2txt
  ];
}
