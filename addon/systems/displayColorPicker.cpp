/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define DIALOG_W 150
#define DIALOG_H 66

class CAU_UserInputMenus_displayColorPicker {
    idd=-1;
    onLoad="uinameSpace setVariable ['CAU_UserInputMenus_displayColorPicker',_this#0]";

    class controlsBackground {
        class tiles: CAU_UserInputMenus_ctrlStaticBackgroundDisableTiles {};
        class background: CAU_UserInputMenus_ctrlStaticBackground {
            idc=IDC_BACKGROUND;

            x=CENTER_XA(DIALOG_W);
            y=CENTER_YA(DIALOG_H) + PX_HA(SIZE_M);
            w=PX_WA(DIALOG_W);
            h=PX_HA(DIALOG_H) - PX_HA(SIZE_M);
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
            y=CENTER_YA(DIALOG_H) + PX_HA(DIALOG_H) - PX_HA((SIZE_M + 2));
            w=PX_WA(DIALOG_W);
            h=PX_HA((SIZE_M + 2));
        };
        class buttonL: CAU_UserInputMenus_ctrlButton {
            idc=IDC_BUTTONL;
            x=CENTER_XA(DIALOG_W) + PX_WA(DIALOG_W) - PX_WA((((SIZE_M*5)*2))) - PX_WA(2);
            y=CENTER_YA(DIALOG_H) + PX_HA(DIALOG_H) - PX_HA((SIZE_M + 1));
            w=PX_WA((SIZE_M*5));
            h=PX_HA(SIZE_M);
        };
        class buttonR: CAU_UserInputMenus_ctrlButton {
            idc=IDC_BUTTONR;
            x=CENTER_XA(DIALOG_W) + PX_WA(DIALOG_W) - PX_WA((SIZE_M*5)) - PX_WA(1);
            y=CENTER_YA(DIALOG_H) + PX_HA(DIALOG_H) - PX_HA((SIZE_M + 1));
            w=PX_WA((SIZE_M*5));
            h=PX_HA(SIZE_M);
        };

    // background right panel
        class editOverlay: CAU_UserInputMenus_ctrlStaticOverlay {
            x=CENTER_XA(DIALOG_W) + PX_WA(4) + ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1));
            y=CENTER_YA(DIALOG_H) + PX_HA(SIZE_M) + PX_HA(2);
            w=PX_WA(DIALOG_W) - PX_WA(6) - ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1));
            h=PX_HA(DIALOG_H) - PX_HA(SIZE_M) - PX_HA((SIZE_M + 2)) - PX_HA(4);
        };
        class editFrame: CAU_UserInputMenus_ctrlStaticFrame {
            x=CENTER_XA(DIALOG_W) + PX_WA(4) + ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1));
            y=CENTER_YA(DIALOG_H) + PX_HA(SIZE_M) + PX_HA(2);
            w=PX_WA(DIALOG_W) - PX_WA(6) - ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1));
            h=PX_HA(DIALOG_H) - PX_HA(SIZE_M) - PX_HA((SIZE_M + 2)) - PX_HA(4);
        };
    };
    class controls {

    // foreground left panel
        class gridGroup: CAU_UserInputMenus_ctrlControlsGroupNoScrollbars {
            idc=IDC_COLOR_GROUP_GRID;
            x=CENTER_XA(DIALOG_W) + PX_WA(2);
            y=CENTER_YA(DIALOG_H) + PX_HA(SIZE_M) + PX_HA(2);
            w=(PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1);
            h=(PX_HA(VAL_CELL_SIZE))*VAL_CELL_COUNT;

            class controls {
                class gridBackground: CAU_UserInputMenus_ctrlStaticBackgroundDisableTiles {
                    x=0;
                    y=0;
                    w=(PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1);
                    h=(PX_HA(VAL_CELL_SIZE))*VAL_CELL_COUNT;
	                tileW=((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1))*2 / (32 * pixelW);
	                tileH=((PX_HA(VAL_CELL_SIZE))*VAL_CELL_COUNT)*2 / (32 * pixelH);
                    colorText[]={1,1,1,0.1};
                };
            };
        };

    // foreground right panel
        class infoGroup: CAU_UserInputMenus_ctrlControlsGroupNoScrollbars {
            idc=IDC_COLOR_GROUP_CTRLS;
            x=CENTER_XA(DIALOG_W) + PX_WA(4) + ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1));
            y=CENTER_YA(DIALOG_H) + PX_HA(SIZE_M) + PX_HA(2);
            w=PX_WA(DIALOG_W) - PX_WA(6) - ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1));
            h=PX_HA(DIALOG_H) - PX_HA(SIZE_M) - PX_HA((SIZE_M + 2)) - PX_HA(4);
       
            class controls {
                class modeToolbox: CAU_UserInputMenus_ctrlToolbox {
                    idc=IDC_COLOR_TOOLBOX_MODE;
                    columns=3;
                    colorSelectedBg[]={0.25,0.25,0.25,1};
                    x=PX_WA(2);
                    y=PX_HA(2);
                    w=PX_WA(DIALOG_W) - PX_WA(10) - ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1));
                    h=PX_HA(SIZE_XL);
                };

                class inputEditRed: CAU_UserInputMenus_ctrlEdit {
                    idc=IDC_COLOR_EDIT_INPUT_R;
                    style=2;
                    colorText[]={1,0,0,1};
                    x=PX_WA(2);
                    y=PX_HA(4) + PX_HA(SIZE_XL);
                    w=((PX_WA(DIALOG_W) - PX_WA(10) - ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1)))/4) - PX_WA(1);
                    h=PX_HA(SIZE_XL);
                };
                class inputEditGreen: inputEditRed {
                    idc=IDC_COLOR_EDIT_INPUT_G;
                    colorText[]={0,1,0,1};
                    x=PX_WA(2.25) + ((PX_WA(DIALOG_W) - PX_WA(10) - ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1)))/4);
                };
                class inputEditBlue: inputEditRed {
                    idc=IDC_COLOR_EDIT_INPUT_B;
                    colorText[]={0.26,0.6,1,1};
                    x=PX_WA(2.5) + (((PX_WA(DIALOG_W) - PX_WA(10) - ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1)))/4)*2);
                };
                class inputEditAlpha: inputEditRed {
                    idc=IDC_COLOR_EDIT_INPUT_A;
                    colorText[]={1,1,1,1};
                    x=PX_WA(2.75) + (((PX_WA(DIALOG_W) - PX_WA(10) - ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1)))/4)*3);
                };

                class sliderRed: CAU_UserInputMenus_ctrlXSliderH {
                    idc=IDC_COLOR_SLIDER_R;
                    x=PX_WA(2);
                    y=PX_HA(6) + PX_HA((SIZE_XL*2));
                    w=PX_WA(DIALOG_W) - PX_WA(10) - ((PX_WA(VAL_CELL_SIZE))*(VAL_CELL_COUNT+1));
                    h=PX_HA(SIZE_XL);
                    color[]={1,0,0,1};
                    colorActive[]={1,0,0,1};
                };
                class sliderGreen: sliderRed {
                    idc=IDC_COLOR_SLIDER_G;
                    y=PX_HA(8) + PX_HA((SIZE_XL*3));
                    color[]={0,1,0,1};
                    colorActive[]={0,1,0,1};
                };
                class sliderBlue: sliderRed {
                    idc=IDC_COLOR_SLIDER_B;
                    y=PX_HA(10) + PX_HA((SIZE_XL*4));
                    color[]={0.26,0.6,1,1};
                    colorActive[]={0.26,0.6,1,1};
                };
                class sliderAlpha: sliderRed {
                    idc=IDC_COLOR_SLIDER_A;
                    y=PX_HA(12) + PX_HA((SIZE_XL*5));
                    color[]={1,1,1,1};
                    colorActive[]={1,1,1,1};
                };
            };
        };
    };
}; 