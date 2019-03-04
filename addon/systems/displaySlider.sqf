/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC CAU_UserInputMenus_fnc_slider
#define DISPLAY_NAME CAU_UserInputMenus_displaySlider

#include "_defines.inc"

SWITCH_SYS_PARAMS;

switch _mode do {
	case "onLoad":{
		uiNamespace setVariable [QUOTE(DISPLAY_NAME),_params#0];
	};
	case "init":{
		_params params [
			["_title","",[""]],
			["_range",[0,0],[[]],2],
			["_position",0,[0]],
			["_speed",[1,1],[[]],2],
			["_button1","",[""]],
			["_code1",{},[{}]],
			["_button2","",[""]],
			["_code2",{},[{}]],
			["_formatVal",{_value},[{}]]
		];

		createDialog QUOTE(DISPLAY_NAME);

		#include "_common.inc"

		_ctrlTitle setVariable ["title",_title];
		_ctrlTitle setVariable ["format",_formatVal];

		_ctrlInput sliderSetRange _range;
		_ctrlInput sliderSetSpeed _speed;
		_ctrlInput sliderSetPosition _position;
		_ctrlInput ctrlAddEventHandler ["SliderPosChanged",{["sliderPosChanged",_this] call THIS_FUNC}];

		["sliderPosChanged",[_ctrlInput,_position]] call THIS_FUNC;
	};
	case "sliderPosChanged":{
		_params params ["_ctrlInput","_value"];
		USE_DISPLAY(ctrlParent _ctrlInput);
		USE_CTRL(_ctrlTitle,IDC_TITLE);

		private _title = _ctrlTitle getVariable ["title","Slider position"];
		private _format = _ctrlTitle getVariable ["format",{_value}];

		_ctrlTitle ctrlSetText format["%1: %2",_title,call _format];
	};
	case "return":{
		_params params ["_display","_bool"];
		USE_CTRL(_ctrlInput,IDC_INPUT);
		private _code = _display getVariable [str _bool,{}];
		private _position = sliderPosition _ctrlInput;
		_display closeDisplay 2;
		[_position] call _code;
	};
};