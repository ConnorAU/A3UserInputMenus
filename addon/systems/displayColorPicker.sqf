/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define DISPLAY_NAME CAU_UserInputMenus_displayColorPicker
#define FUNC(a) ((THIS_DISPLAY) getVariable [a,{}])

#include "_macros.inc"
#include "_defines.inc"

#define VAL_GRID_START_IDC 100
#define VAL_HEX_TABLE [\
	"00","01","02","03","04","05","06","07","08","09","0A","0B","0C","0D","0E","0F",\
	"10","11","12","13","14","15","16","17","18","19","1A","1B","1C","1D","1E","1F",\
	"20","21","22","23","24","25","26","27","28","29","2A","2B","2C","2D","2E","2F",\
	"30","31","32","33","34","35","36","37","38","39","3A","3B","3C","3D","3E","3F",\
	"40","41","42","43","44","45","46","47","48","49","4A","4B","4C","4D","4E","4F",\
	"50","51","52","53","54","55","56","57","58","59","5A","5B","5C","5D","5E","5F",\
	"60","61","62","63","64","65","66","67","68","69","6A","6B","6C","6D","6E","6F",\
	"70","71","72","73","74","75","76","77","78","79","7A","7B","7C","7D","7E","7F",\
	"80","81","82","83","84","85","86","87","88","89","8A","8B","8C","8D","8E","8F",\
	"90","91","92","93","94","95","96","97","98","99","9A","9B","9C","9D","9E","9F",\
	"A0","A1","A2","A3","A4","A5","A6","A7","A8","A9","AA","AB","AC","AD","AE","AF",\
	"B0","B1","B2","B3","B4","B5","B6","B7","B8","B9","BA","BB","BC","BD","BE","BF",\
	"C0","C1","C2","C3","C4","C5","C6","C7","C8","C9","CA","CB","CC","CD","CE","CF",\
	"D0","D1","D2","D3","D4","D5","D6","D7","D8","D9","DA","DB","DC","DD","DE","DF",\
	"E0","E1","E2","E3","E4","E5","E6","E7","E8","E9","EA","EB","EC","ED","EE","EF",\
	"F0","F1","F2","F3","F4","F5","F6","F7","F8","F9","FA","FB","FC","FD","FE","FF"\
]
#define VAL_VALID_NUMERIC ["0","1","2","3","4","5","6","7","8","9","."]
#define VAL_VALID_HEX ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]

#define GRID_COLOR(x,i) linearConversion[0,VAL_CELL_COUNT,x,i,1,true]

params [
	["_parameters",[],[[]]],
	["_title","",[""]],
	["_code",{},[{},[]]],
	["_button1","",[""]],
	["_button2",0,[""]],
	["_parentDisplay",displayNull,[displayNull]]
];
_parameters params [
	["_color",[],[[],""]]
];
_code params [["_code",{},[{}]],["_args",[],[[]]]];

if (!isNull _parentDisplay) then {
	_parentDisplay createDisplay QUOTE(DISPLAY_NAME);
} else {
	createDialog QUOTE(DISPLAY_NAME);
};

private _return = {
	params ["_display","_confirmed"];
	private _args = _display getVariable ["args",[]];
	private _code = _display getVariable ["code",{}];

	private _colorRGBA1 = _display getVariable ["selectedColor",[0,0,0,1]];
	private _colorRGBA256 = _colorRGBA1 call FUNC("RGBA1toRGBA256");
	private _colorHTML = if ((_colorRGBA1#3) == 1) then {
		_colorRGBA1 call BIS_fnc_colorRGBtoHTML;
	} else {
		_colorRGBA1 call BIS_fnc_colorRGBAtoHTML;
	};

	_display closeDisplay 2;
	[_args,_code] call {
		private ["_display","_code","_args"];
		(_this#0) call (_this#1);
	};
};

#include "_common.inc"

[
	["createGrid",{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlGroup,IDC_COLOR_GROUP_GRID);

		private _x = 0;
		private _y = 0;

		// there is simply no way I'm about to write all these into the config
		for "_i" from 0 to 1000 do {
			private _ctrl = _display ctrlCreate ["ctrlStructuredText",VAL_GRID_START_IDC + _i,_ctrlGroup];
			_ctrl ctrlSetPosition [
				_x*(PX_WA(VAL_CELL_SIZE)),
				_y*(PX_HA(VAL_CELL_SIZE)),
				PX_WA(VAL_CELL_SIZE),
				PX_HA(VAL_CELL_SIZE)
			];
			_ctrl ctrlAddEventHandler ["ButtonClick",{_this call FUNC("gridClicked")}];
			_ctrl ctrlCommit 0;

			_y = _y + 1;
			if (_y == VAL_CELL_COUNT) then {
				_x = _x + 1;
				_y = 0;
			};
			if (_x > VAL_CELL_COUNT) exitWith {
				_ctrlGroup setVariable ["maxIDC",_i];
			};
		};
	}],
	["updateGridColor",{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlTitle,IDC_COLOR_GROUP_GRID);
		USE_CTRL(_ctrlGroup,IDC_COLOR_GROUP_GRID);
		USE_CTRL(_ctrlSliderR,IDC_COLOR_SLIDER_R);
		USE_CTRL(_ctrlSliderG,IDC_COLOR_SLIDER_G);
		USE_CTRL(_ctrlSliderB,IDC_COLOR_SLIDER_B);
		USE_CTRL(_ctrlSliderA,IDC_COLOR_SLIDER_A);

		private _maxIDC = _ctrlGroup getVariable ["maxIDC",0];
		private _ctrlSliderRPos = sliderPosition _ctrlSliderR;
		private _ctrlSliderGPos = sliderPosition _ctrlSliderG;
		private _ctrlSliderBPos = sliderPosition _ctrlSliderB;
		private _ctrlSliderAPos = sliderPosition _ctrlSliderA;

		[[_ctrlSliderRPos,_ctrlSliderGPos,_ctrlSliderBPos,_ctrlSliderAPos]] call FUNC("updateTitleBar");

		private _x = 0;
		private _y = 0;

		for "_i" from 0 to _maxIDC do {
			USE_CTRL(_ctrl,VAL_GRID_START_IDC + _i);

			private _colorRGBA = [
				GRID_COLOR(_x,_ctrlSliderRPos) * (1-(_y/VAL_CELL_COUNT)),
				GRID_COLOR(_x,_ctrlSliderGPos) * (1-(_y/VAL_CELL_COUNT)),
				GRID_COLOR(_x,_ctrlSliderBPos) * (1-(_y/VAL_CELL_COUNT)),
				_ctrlSliderAPos
			];
			private _colorHTML = if (_ctrlSliderAPos < 1) then {
				_colorRGBA call BIS_fnc_colorRGBAtoHTML
			} else {
				_colorRGBA call BIS_fnc_colorRGBtoHTML
			};

			_ctrl ctrlSetBackgroundColor _colorRGBA;
			_ctrl ctrlSetTooltip _colorHTML;
			_ctrl ctrlSetTooltipColorShade _colorRGBA;
			_ctrl setVariable ["color",str _colorRGBA];
			_ctrl ctrlCommit 0;

			_y = _y + 1;
			if (_y == VAL_CELL_COUNT) then {
				_x = _x + 1;
				_y = 0;
			};
		};
	}],
	["updateEdit",{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlToolboxMode,IDC_COLOR_TOOLBOX_MODE);
		USE_CTRL(_ctrlEditR,IDC_COLOR_EDIT_INPUT_R);
		USE_CTRL(_ctrlEditG,IDC_COLOR_EDIT_INPUT_G);
		USE_CTRL(_ctrlEditB,IDC_COLOR_EDIT_INPUT_B);
		USE_CTRL(_ctrlEditA,IDC_COLOR_EDIT_INPUT_A);
		USE_CTRL(_ctrlSliderR,IDC_COLOR_SLIDER_R);
		USE_CTRL(_ctrlSliderG,IDC_COLOR_SLIDER_G);
		USE_CTRL(_ctrlSliderB,IDC_COLOR_SLIDER_B);
		USE_CTRL(_ctrlSliderA,IDC_COLOR_SLIDER_A);

		private _mode = lbCurSel _ctrlToolboxMode;
		private _color = [
			sliderPosition _ctrlSliderR,
			sliderPosition _ctrlSliderG,
			sliderPosition _ctrlSliderB,
			sliderPosition _ctrlSliderA
		];

		(switch _mode do {
			case 0:{_color call FUNC("outputRGBA1")};
			case 1:{_color call FUNC("RGBA1toRGBA256")};
			case 2:{
				private _hex = _color call BIS_fnc_colorRGBAtoHTML;
				[
					_hex select [3,2],
					_hex select [5,2],
					_hex select [7,2],
					_hex select [1,2]
				]
			};
			default {[1,1,1,1]};
		}) params ["_r","_g","_b","_a"];

		_ctrlEditR ctrlSetText format["%1",_r];
		_ctrlEditG ctrlSetText format["%1",_g];
		_ctrlEditB ctrlSetText format["%1",_b];
		_ctrlEditA ctrlSetText format["%1",_a];
	}],
	["updateSlider",{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlToolboxMode,IDC_COLOR_TOOLBOX_MODE);
		USE_CTRL(_ctrlEditR,IDC_COLOR_EDIT_INPUT_R);
		USE_CTRL(_ctrlEditG,IDC_COLOR_EDIT_INPUT_G);
		USE_CTRL(_ctrlEditB,IDC_COLOR_EDIT_INPUT_B);
		USE_CTRL(_ctrlEditA,IDC_COLOR_EDIT_INPUT_A);
		USE_CTRL(_ctrlSliderR,IDC_COLOR_SLIDER_R);
		USE_CTRL(_ctrlSliderG,IDC_COLOR_SLIDER_G);
		USE_CTRL(_ctrlSliderB,IDC_COLOR_SLIDER_B);
		USE_CTRL(_ctrlSliderA,IDC_COLOR_SLIDER_A);

		private _mode = lbCurSel _ctrlToolboxMode;
		private _color = [
			ctrlText _ctrlEditR,
			ctrlText _ctrlEditG,
			ctrlText _ctrlEditB,
			ctrlText _ctrlEditA
		];

		(switch _mode do {
			case 0:{(_color apply {parseNumber _x}) call FUNC("outputRGBA1")};
			case 1:{(_color apply {parseNumber _x}) call FUNC("RGBA256toRGBA1")};
			case 2:{[_color#3,_color#0,_color#1,_color#2] call FUNC("htmlToRGBA1")};
			default {[1,1,1,1]};
		}) params ["_r","_g","_b","_a"];

		_ctrlSliderR sliderSetPosition _r;
		_ctrlSliderG sliderSetPosition _g;
		_ctrlSliderB sliderSetPosition _b;
		_ctrlSliderA sliderSetPosition _a;
	}],
	["updateTitleBar",{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlTitle,IDC_TITLE);
		params [["_color",[0,0,0,1],[[]],4]];
		_ctrlTitle ctrlSetBackgroundColor _color;
		_display setVariable ["selectedColor",_color];
	}],
	["editKeyUp",{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlToolboxMode,IDC_COLOR_TOOLBOX_MODE);

		private _mode = lbCurSel _ctrlToolboxMode;

		private _ctrlText = toUpper ctrlText _ctrl;
		private _validText = "";
		private _validChars = [VAL_VALID_NUMERIC,VAL_VALID_HEX] select (_mode == 2);
		{
			if (_x in _validChars) then {
				_validText = _validText + _x;
			};
		} forEach (_ctrlText splitString "");
		if (_ctrlText != _validText) then {
			if (_validText == "") then {
				_validText = ["0","00"] select (_mode == 2);
			};
			_ctrl ctrlSetText _validText;
		};
		[] call FUNC("updateSlider");
		[] call FUNC("updateGridColor");
	}],
	["sliderPosChanged",{
		params ["_ctrl"];
		USE_DISPLAY(ctrlParent _ctrl);
		USE_CTRL(_ctrlSliderR,IDC_COLOR_SLIDER_R);
		USE_CTRL(_ctrlSliderG,IDC_COLOR_SLIDER_G);
		USE_CTRL(_ctrlSliderB,IDC_COLOR_SLIDER_B);
		USE_CTRL(_ctrlSliderA,IDC_COLOR_SLIDER_A);

		[] call FUNC("updateEdit");
		[] call FUNC("updateGridColor");
	}],
	["gridClicked",{
		params ["_ctrl"];
		USE_DISPLAY(ctrlParent _ctrl);
		USE_CTRL(_ctrlSliderR,IDC_COLOR_SLIDER_R);
		USE_CTRL(_ctrlSliderG,IDC_COLOR_SLIDER_G);
		USE_CTRL(_ctrlSliderB,IDC_COLOR_SLIDER_B);
		USE_CTRL(_ctrlSliderA,IDC_COLOR_SLIDER_A);

		private _color = parseSimpleArray(_ctrl getVariable ["color",[]]);

		_ctrlSliderR sliderSetPosition (_color#0);
		_ctrlSliderG sliderSetPosition (_color#1);
		_ctrlSliderB sliderSetPosition (_color#2);
		_ctrlSliderA sliderSetPosition (_color#3);

		[] call FUNC("updateEdit");
		[_color] call FUNC("updateTitleBar");
	}],
	["outputRGBA1",{
		// round to nearest 3 decimal places
		_this apply {(round(_x*1000))/1000};
	}],
	["RGBA1toRGBA256",{
		_this apply {round(_x*255)};
	}],
	["RGBA256toRGBA1",{
		_this apply {_x/255};
	}],
	["htmlToRGBA1",{
		private _out = [];
		{
			_out pushback linearConversion[0,255,VAL_HEX_TABLE find toUpper _x,0,1,true];
		} foreach _this;
		if (count _out == 4) then {
			// #AARRGGBB
			// move alpha to end of array
			_out pushBack (_out deleteAt 0);
		} else {
			_out pushBack 1;
		};
		_out
	}]
] apply {_display setVariable _x};

USE_CTRL(_ctrlToolboxMode,IDC_COLOR_TOOLBOX_MODE);
USE_CTRL(_ctrlEditR,IDC_COLOR_EDIT_INPUT_R);
USE_CTRL(_ctrlEditG,IDC_COLOR_EDIT_INPUT_G);
USE_CTRL(_ctrlEditB,IDC_COLOR_EDIT_INPUT_B);
USE_CTRL(_ctrlEditA,IDC_COLOR_EDIT_INPUT_A);
USE_CTRL(_ctrlSliderR,IDC_COLOR_SLIDER_R);
USE_CTRL(_ctrlSliderG,IDC_COLOR_SLIDER_G);
USE_CTRL(_ctrlSliderB,IDC_COLOR_SLIDER_B);
USE_CTRL(_ctrlSliderA,IDC_COLOR_SLIDER_A);

{
	_ctrlToolboxMode lbAdd _x;
} forEach ["RGBA 0-1","RGBA 0-255","HTML #"];
_ctrlToolboxMode lbSetCurSel 0;
_ctrlToolboxMode ctrlAddEventHandler ["ToolBoxSelChanged",{[] call FUNC("updateEdit")}];

{
	_x ctrlAddEventHandler ["KeyUp",{[] call FUNC("editKeyUp")}];
} foreach [_ctrlEditR,_ctrlEditG,_ctrlEditB,_ctrlEditA];

private _startColorType = 0;
private _startColor = if (count _color > 0) then {
	if (_color isEqualType "") then {
		_startColorType = 2;
		if (_color find "#" == 0) then {
			_color = _color select [1,count _color];
		};
		private _split = [
			_color select [0,2],
			_color select [2,2],
			_color select [4,2],
			_color select [6,2]
		];
		_split = _split - [""];
		_split call FUNC("htmlToRGBA1");
	} else {
		if ((_color findIf {_x > 1}) > -1) then {
			_startColorType = 1;
			_color call FUNC("RGBA256toRGBA1");
		} else {_color};
	};
} else {
	(configFile >> "ctrlStaticTitle" >> "colorBackground") call BIS_fnc_colorConfigToRGBA;
};

_ctrlToolboxMode lbSetCurSel _startColorType;

{
	_x params ["_ctrl","_pos"];
	_ctrl sliderSetRange [0,1];
	_ctrl sliderSetSpeed [1/256,0.1];
	_ctrl sliderSetPosition _pos;
	_ctrl ctrlAddEventHandler ["SliderPosChanged",{_this call FUNC("sliderPosChanged")}];
} foreach [
	[_ctrlSliderR,_startColor#0],
	[_ctrlSliderG,_startColor#1],
	[_ctrlSliderB,_startColor#2],
	[_ctrlSliderA,_startColor#3]
];

[] call FUNC("createGrid");
[] call FUNC("updateGridColor");
[] call FUNC("updateEdit");
