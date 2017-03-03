{ config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        fcitx
     	fcitx-configtool
    	fcitx-engines.cloudpinyin
        fcitx-engines.libpinyin
        libsForQt5.fcitx-qt5
    ];

    i18n.inputMethod = {
        enabled = "fcitx";
    #    fcitx.engines = with pkgs.fcitx-engines; [ libpinyin cloudpinyin ];
    };
}
