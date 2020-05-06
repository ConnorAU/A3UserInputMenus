/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define DISPLAY_NAME CAU_UserInputMenus_displaySlider

#include "_defines.inc"

params [
	["_parameters",[],[[]]],
	["_title","",[""]],
	["_formatVal",{},[{}]],
	["_code",{},[{}]],
	["_button1","",[""]],
	["_button2",0,[""]],
	["_parentDisplay",displayNull,[displayNull]]
];
_parameters params [
	["_range",[0,0],[[]],2],
	["_position",0,[0]],
	["_speed",[1,1],[[]],2]
];

if (!isNull _parentDisplay) then {
	_parentDisplay createDisplay QUOTE(DISPLAY_NAME);
} else {
	createDialog QUOTE(DISPLAY_NAME);
};

private _return = {
	params ["_display","_confirmed"];
	USE_CTRL(_ctrlInput,IDC_INPUT);
	private _code = _display getVariable ["code",{}];
	private _position = [-1,sliderPosition _ctrlInput] select _confirmed;
	_display closeDisplay 2;
	_code call {
		private ["_display","_ctrlInput","_code"];
		[] call _this;
	};
};

#include "_common.inc"

_ctrlTitle setVariable ["title",_title];
_ctrlTitle setVariable ["format",[_formatVal,{_position}] select (str _formatVal == "{}")];
_ctrlInput setVariable ["sliderPosChanged",{
	params ["_ctrlInput","_position"];
	USE_DISPLAY(ctrlParent _ctrlInput);
	USE_CTRL(_ctrlTitle,IDC_TITLE);

	private _title = _ctrlTitle getVariable ["title","Slider position"];
	private _format = _ctrlTitle getVariable ["format",{_position}];

	_ctrlTitle ctrlSetText format["%1: %2",_title,call _format];
}];

_ctrlInput sliderSetRange _range;
_ctrlInput sliderSetSpeed _speed;
_ctrlInput sliderSetPosition _position;
_ctrlInput ctrlAddEventHandler ["SliderPosChanged",{_this call ((_this#0) getVariable ["sliderPosChanged",{}])}];

[_ctrlInput,_position] call (_ctrlInput getVariable ["sliderPosChanged",{}]);