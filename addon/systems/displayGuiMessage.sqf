/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define DISPLAY_NAME CAU_UserInputMenus_displayGuiMessage

#include "_macros.inc"
#include "_defines.inc"

params [
	["_parameters",[],[[]]],
	["_title","",[""]],
	["_code",{},[{}]],
	["_button1","",[""]],
	["_button2",0,[""]],
	["_parentDisplay",displayNull,[displayNull]]
];
_parameters params [
	["_text","",[""]]
];

if (!isNull _parentDisplay) then {
	_parentDisplay createDisplay QUOTE(DISPLAY_NAME);
} else {
	createDialog QUOTE(DISPLAY_NAME);
};

private _return = {
	params ["_display","_confirmed"];
	private _code = _display getVariable ["code",{}];
	_display closeDisplay 2;
	_code call {
		private ["_display","_code"];
		[] call _this;
	};
};

#include "_common.inc"

_ctrlInput ctrlSetStructuredText parseText _text;

private _ctrlInputHeight = ctrlTextHeight _ctrlInput;
private _ctrlMaxHeight = PX_HA(((safezoneH/GRID_H) - 10));

private _ctrlBackgroundPos = ctrlPosition _ctrlBackground;
_ctrlBackgroundPos set [3,_ctrlMaxHeight min (_ctrlInputHeight + PX_HA(SIZE_M) + PX_HA(SIZE_XXL) + PX_HA(4))];
_ctrlBackgroundPos set [1,CENTER_Y - (0.5*(_ctrlBackgroundPos#3))];
_ctrlBackground ctrlSetPosition _ctrlBackgroundPos;
_ctrlBackground ctrlCommit 0;

private _ctrlTitlePos = ctrlPosition _ctrlTitle;
_ctrlTitlePos set [1,_ctrlBackgroundPos#1];
_ctrlTitle ctrlSetPosition _ctrlTitlePos;
_ctrlTitle ctrlCommit 0;

private _ctrlFooterPos = ctrlPosition _ctrlFooter;
_ctrlFooterPos set [1,_ctrlBackgroundPos#1 + _ctrlBackgroundPos#3 - _ctrlFooterPos#3];
_ctrlFooter ctrlSetPosition _ctrlFooterPos;
_ctrlFooter ctrlCommit 0;

USE_CTRL(_ctrlInputContainer,IDC_INPUTCONTAINER);
private _ctrlInputContainerPos = ctrlPosition _ctrlInputContainer;
_ctrlInputContainerPos set [1,_ctrlBackgroundPos#1 + _ctrlTitlePos#3 + PX_HA(2)];
_ctrlInputContainerPos set [3,(_ctrlMaxHeight - PX_HA(SIZE_M) - PX_HA(SIZE_XXL) - PX_HA(4)) min _ctrlInputHeight];
_ctrlInputContainer ctrlSetPosition _ctrlInputContainerPos;
_ctrlInputContainer ctrlCommit 0;

private _ctrlInputPos = ctrlPosition _ctrlInput;
//_ctrlInputPos set [1,_ctrlBackgroundPos#1 + _ctrlTitlePos#3 + PX_HA(2)];
_ctrlInputPos set [3,_ctrlInputHeight];
_ctrlInput ctrlSetPosition _ctrlInputPos;
_ctrlInput ctrlCommit 0;

private _ctrlButtonLPos = ctrlPosition _ctrlButtonL;
_ctrlButtonLPos set [1,_ctrlFooterPos#1 + PX_HA(1)];
_ctrlButtonL ctrlSetPosition _ctrlButtonLPos;
_ctrlButtonL ctrlCommit 0;

private _ctrlButtonRPos = ctrlPosition _ctrlButtonR;
_ctrlButtonRPos set [1,_ctrlFooterPos#1 + PX_HA(1)];
_ctrlButtonR ctrlSetPosition _ctrlButtonRPos;
_ctrlButtonR ctrlCommit 0;