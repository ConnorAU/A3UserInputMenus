/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC CAU_uim_fnc_text
#define DISPLAY_NAME CAU_UserInputMenus_displayText

#include "_defines.inc"

SWITCH_SYS_PARAMS;

switch _mode do {
	case "onLoad":{
		uiNamespace setVariable [QUOTE(DISPLAY_NAME),_params#0];
	};
	case "init":{
		_params params [
			["_multiLine",false,[true]],
			["_title","",[""]],
			["_button1","",[""]],
			["_code1",{},[{}]],
			["_button2","",[""]],
			["_code2",{},[{}]]
		];

		createDialog ([QUOTE(DISPLAY_NAME),QUOTE(JOIN(DISPLAY_NAME,Multi))] select _multiLine);
		
		#include "_common.inc"
	};
	case "return":{
		_params params ["_display","_bool"];
		USE_CTRL(_ctrlInput,IDC_INPUT);
		private _code = _display getVariable [str _bool,{}];
		private _text = ctrlText _ctrlInput;
		_display closeDisplay 2;
		[_text] call _code;
	};
};