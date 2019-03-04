/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC CAU_UserInputMenus_fnc_guiMessage
#define DISPLAY_NAME CAU_UserInputMenus_displayGuiMessage

#include "_macros.inc"
#include "_defines.inc"

SWITCH_SYS_PARAMS;

switch _mode do {
	case "onLoad":{
		uiNamespace setVariable [QUOTE(DISPLAY_NAME),_params#0];
	};
	case "init":{
		_params params [
			["_text","",[""]],
			["_title","",[""]],
			["_button1","",[""]],
			["_code1",{},[{}]],
			["_button2","",[""]],
			["_code2",{},[{}]]
		];

		createDialog QUOTE(DISPLAY_NAME);

		#include "_common.inc"

		_ctrlInput ctrlSetStructuredText parseText _text;

		private _ctrlInputHeight = ctrlTextHeight _ctrlInput;

		private _ctrlBackgroundPos = ctrlPosition _ctrlBackground;
		_ctrlBackgroundPos set [3,_ctrlInputHeight + PX_HA(SIZE_M) + PX_HA(SIZE_XXL) + PX_HA(2)];
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

		private _ctrlInputPos = ctrlPosition _ctrlInput;
		_ctrlInputPos set [3,_ctrlInputHeight];
		_ctrlInputPos set [1,_ctrlBackgroundPos#1 + _ctrlTitlePos#3 + PX_HA(1)];
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
	};
	case "return":{
		_params params ["_display","_bool"];
		private _code = _display getVariable [str _bool,{}];
		_display closeDisplay 2;
		[] call _code;
	};
};