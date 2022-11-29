/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define DISPLAY_NAME CAU_UserInputMenus_displayListbox

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
	["_items",[],[[]]],
	["_startIndex",0,[0]],
	["_multiSel",false,[true]]
];
_code params [["_code",{},[{}]],["_args",[],[[]]]];

if (!isNull _parentDisplay) then {
	_parentDisplay createDisplay ([QUOTE(DISPLAY_NAME),QUOTE(JOIN(DISPLAY_NAME,Multi))] select _multiSel);
} else {
	createDialog ([QUOTE(DISPLAY_NAME),QUOTE(JOIN(DISPLAY_NAME,Multi))] select _multiSel);
};

private _return = [{
	params ["_display","_confirmed"];
	USE_CTRL(_ctrlInput,IDC_INPUT);
	private _args = _display getVariable ["args",[]];
	private _code = _display getVariable ["code",{}];
	if !_confirmed then {_ctrlInput lbSetCurSel -1};
	private _index = lbCurSel _ctrlInput;
	private _data = _ctrlInput lbData _index;
	private _value = _ctrlInput lbValue _index;
	_display closeDisplay 2;
	[_args,_code] call {
		private ["_display","_ctrlInput","_code","_args"];
		(_this#0) call (_this#1);
	};
},{
	params ["_display","_confirmed"];
	USE_CTRL(_ctrlInput,IDC_INPUT);
	private _args = _display getVariable ["args",[]];
	private _code = _display getVariable ["code",{}];
	if !_confirmed then {
		for "_i" from 0 to (lbSize _ctrlInput - 1) do {
			_ctrlInput lbSetSelected [_i,false];
		};
	};
	private _index = lbSelection _ctrlInput;
	private _data = _index apply {_ctrlInput lbData _x};
	private _value = _index apply {_ctrlInput lbValue _x};
	_display closeDisplay 2;
	[_args,_code] call {
		private ["_display","_ctrlInput","_code","_args"];
		(_this#0) call (_this#1);
	};
}] select _multiSel;

#include "_common.inc"

lbClear _ctrlInput;
{
	_x params [
		["_textLData",[],[[]]],
		["_textRData",[],[[]]],
		["_iconLData",[],[[]]],
		["_iconRData",[],[[]]],
		["_tooltip","",[""]],
		["_data","",[""]],
		["_value",-1,[0]]
	];

	_textLData params [["_text","",[""]],["_color",[1,1,1,1],[[]],4]];
	private _index = _ctrlInput lbAdd _text;
	_ctrlInput lbSetColor [_index,_color];
	_ctrlInput lbSetSelectColor [_index,_color];

	_textRData params [["_text","",[""]],["_color",[1,1,1,1],[[]],4]];
	_ctrlInput lbSetTextRight [_index,_text];
	_ctrlInput lbSetColorRight [_index,_color];
	_ctrlInput lbSetSelectColorRight [_index,_color];

	_iconLData params [["_text","",[""]],["_color",[1,1,1,1],[[]],4]];
	_ctrlInput lbSetPicture [_index,_text];
	_ctrlInput lbSetPictureColor [_index,_color];
	_ctrlInput lbSetPictureColorSelected [_index,_color];

	_iconRData params [["_text","",[""]],["_color",[1,1,1,1],[[]],4]];
	_ctrlInput lbSetPictureRight [_index,_text];
	_ctrlInput lbSetPictureRightColor [_index,_color];
	_ctrlInput lbSetPictureRightColorSelected [_index,_color];

	_ctrlInput lbSetTooltip [_index,_tooltip];
	_ctrlInput lbSetData [_index,_data];
	_ctrlInput lbSetValue [_index,_value];
} forEach _items;

private _index = 0 max _startIndex min (lbSize _ctrlInput - 1);
_ctrlInput lbSetCurSel _index;
if _multiSel then {_ctrlInput lbSetSelected [_index,true]};
