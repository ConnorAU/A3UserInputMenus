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
	["_parameters",[],[[]]],
	["_title","",[""]],
	["_code",{},[{},[]]],
	["_button1","",[""]],
	["_button2",0,[""]],
	["_parentDisplay",displayNull,[displayNull]]
];
_parameters params [
	["_multiLine",false,[true]],
	["_startText","",[""]]
];
_code params [["_code",{},[{}]],["_args",[],[[]]]];

if (!isNull _parentDisplay) then {
	_parentDisplay createDisplay ([QUOTE(DISPLAY_NAME),QUOTE(JOIN(DISPLAY_NAME,Multi))] select _multiLine);
} else {
	createDialog ([QUOTE(DISPLAY_NAME),QUOTE(JOIN(DISPLAY_NAME,Multi))] select _multiLine);
};

private _return = {
	params ["_display","_confirmed"];
	USE_CTRL(_ctrlInput,IDC_INPUT);
	private _args = _display getVariable ["args",[]];
	private _code = _display getVariable ["code",{}];
	private _text = ["",ctrlText _ctrlInput] select _confirmed;
	_display closeDisplay 2;
	[_args,_code] call {
		private ["_display","_ctrlInput","_code","_args"];
		(_this#0) call (_this#1);
	};
};

#include "_common.inc"

_ctrlInput ctrlSetText _startText;
//_ctrlInput ctrlSetTextSelection [count _startText,0]; // TODO: activate this once the command enters production branch
ctrlSetFocus _ctrlInput;
