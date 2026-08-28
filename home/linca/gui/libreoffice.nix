{ pkgs, ... }: {
  home.packages = with pkgs; [
    libreoffice
  ];

  funkcia.hm.xdg.mime.defaultApplications = {
    wordFormats = [ "writer.desktop" ];
    excelFormats = [ "calc.desktop" ];
    pptFormats = [ "impress.desktop" ];
  };
}
