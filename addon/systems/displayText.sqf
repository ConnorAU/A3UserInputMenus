/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define DISPLAY_NAME CAU_UserInputMenus_displayText

#include "_defines.inc"

params [
	["_multiLine",false,[true]],
	["_title","",[""]],
	["_code",{},[{}]],
	["_button1","",[""]],
	["_button2",0,[""]]
];

createDialog ([QUOTE(DISPLAY_NAME),QUOTE(JOIN(DISPLAY_NAME,Multi))] select _multiLine);

private _return = {
	params ["_display","_confirmed"];
	USE_CTRL(_ctrlInput,IDC_INPUT);
	private _code = _display getVariable ["code",{}];
	private _text = ["",ctrlText _ctrlInput] select _confirmed;
	_display closeDisplay 2;
	_code call {
		private ["_display","_ctrlInput","_code"];
		[] call _this;
	};
};

#include "_common.inc"