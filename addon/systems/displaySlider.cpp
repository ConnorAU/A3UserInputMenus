/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define DIALOG_W 110
#define DIALOG_H (SIZE_M + 2 + SIZE_M + 2 + SIZE_XXL)

class CAU_UserInputMenus_displaySlider {
    idd=-1;
    onLoad="uinameSpace setVariable ['CAU_UserInputMenus_displaySlider',_this#0]";

    class controlsBackground {
        class tiles: CAU_UserInputMenus_ctrlStaticBackgroundDisableTiles {};
        class background: CAU_UserInputMenus_ctrlStaticBackground {
            idc=IDC_BACKGROUND;

            x=CENTER_XA(DIALOG_W);
            y=CENTER_YA(DIALOG_H);
            w=PX_WA(DIALOG_W);
            h=PX_HA(DIALOG_H);
        };
        class title: CAU_UserInputMenus_ctrlStaticTitle {
            idc=IDC_TITLE;

            x=CENTER_XA(DIALOG_W);
            y=CENTER_YA(DIALOG_H);
            w=PX_WA(DIALOG_W);
            h=PX_HA(SIZE_M);
        };
        class footer: CAU_UserInputMenus_ctrlStaticFooter {
            idc=IDC_FOOTER;

            x=CENTER_XA(DIALOG_W);
            y=CENTER_YA(DIALOG_H) + PX_HA(DIALOG_H) - PX_HA(SIZE_XXL);
            w=PX_WA(DIALOG_W);
            h=PX_HA(SIZE_XXL);
        };
    };
    class controls {
        class text: CAU_UserInputMenus_ctrlXSliderH {
            idc=IDC_INPUT;
            size=PX_HA(SIZE_M);

            x=CENTER_XA(DIALOG_W) + PX_WA(2);
            y=CENTER_YA(DIALOG_H) + PX_HA(SIZE_M) + PX_HA(2);
            w=PX_WA(DIALOG_W) - PX_WA(4);
            h=PX_HA(SIZE_M);
        };
        class buttonL: CAU_UserInputMenus_ctrlButton {
            idc=IDC_BUTTONL;

            x=CENTER_XA(DIALOG_W) + PX_WA(DIALOG_W) - PX_WA(((SIZE_M*6)*2)) - PX_WA(2);
            y=CENTER_YA(DIALOG_H) + PX_HA(DIALOG_H) - PX_HA(SIZE_M) - PX_HA(1);
            w=PX_WA((SIZE_M*6));
            h=PX_HA(SIZE_M);
        };
        class buttonR: buttonL {
            idc=IDC_BUTTONR;

            x=CENTER_XA(DIALOG_W) + PX_WA(DIALOG_W) - PX_WA((SIZE_M*6)) - PX_WA(1);
        };
    };
};