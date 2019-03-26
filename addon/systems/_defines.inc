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
#define IDC_BACKGROUND 1
#define IDC_TITLE 2
#define IDC_FOOTER 3
#define IDC_INPUTCONTAINER 4
#define IDC_INPUT 5
#define IDC_BUTTONL 6
#define IDC_BUTTONR 7
