/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

// ~ Operations
#define QUOTE(a) #a
#define JOIN(a,b) a##b

#ifdef DISPLAY_NAME
    #define THIS_DISPLAY DISPLAY(DISPLAY_NAME)
    #define DISPLAY(name) uiNameSpace getVariable [QUOTE(name),displayNull]
    #define USE_DISPLAY(display) private _display = display
    #define USE_CTRL(ctrl,idc) private ctrl = _display displayCtrl idc
#endif

// ~ UI Positioning
#ifdef pixelScale
    #define PX_WA(n) n*GRID_W
    #define PX_HA(n) n*GRID_H
    #define CENTER_XA(n) (CENTER_X)-(0.5*(PX_WA(n)))
    #define CENTER_YA(n) (CENTER_Y)-(0.5*(PX_HA(n)))
    #define SIZE_XXL 7
#endif

// ~ Display IDCs
#define IDC_BACKGROUND              1
#define IDC_TITLE                   2
#define IDC_FOOTER                  3
#define IDC_INPUTCONTAINER          4
#define IDC_INPUT                   5
#define IDC_BUTTONL                 6
#define IDC_BUTTONR                 7

// ~ Color picker IDCs
#define IDC_COLOR_GROUP_GRID        10
#define IDC_COLOR_GROUP_CTRLS       11
#define IDC_COLOR_TOOLBOX_MODE      12
#define IDC_COLOR_EDIT_INPUT_R      13
#define IDC_COLOR_EDIT_INPUT_G      14
#define IDC_COLOR_EDIT_INPUT_B      15
#define IDC_COLOR_EDIT_INPUT_A      16
#define IDC_COLOR_SLIDER_R          17
#define IDC_COLOR_SLIDER_G          18
#define IDC_COLOR_SLIDER_B          19
#define IDC_COLOR_SLIDER_A          20

// ~ Color picker values used on both display and script
#define VAL_CELL_SIZE 2
#define VAL_CELL_COUNT 25