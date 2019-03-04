/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

class CfgPatches {
	class ConnorAU_UserInputMenus {
        name="UserInputMenus";
        author="ConnorAU";
        url="https://github.com/ConnorAU/A3UserInputMenus";

		requiredVersion=0.01;
		requiredAddons[]={"A3_3DEN"};
		units[]={};
		weapons[]={};
	};
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

#include "controls.cpp"
#include "systems\_macros.inc"
#include "systems\_defines.inc"
#include "systems\displayGuiMessage.cpp"
#include "systems\displayListbox.cpp"
#include "systems\displaySlider.cpp"
#include "systems\displayText.cpp"
#include "systems\displayTextMulti.cpp"