/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC CAU_uim_fnc_listbox
#define DISPLAY_NAME CAU_UserInputMenus_displayListbox

#include "_defines.inc"

SWITCH_SYS_PARAMS;

switch _mode do {
	case "onLoad":{
		uiNamespace setVariable [QUOTE(DISPLAY_NAME),_params#0];
	};
	case "init":{
		_params params [
			["_title","",[""]],
			["_items",[],[[]]],
			["_button1","",[""]],
			["_code1",{},[{}]],
			["_button2","",[""]],
			["_code2",{},[{}]]
		];

		createDialog QUOTE(DISPLAY_NAME);

		#include "_common.inc"

		lbClear _ctrlInput;
		private _index = -1;
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
			
			{
				_x params [["_text","",[""]],["_color",[1,1,1,1],[[]],4]];
				switch _forEachIndex do {
					case 0:{
						_index = _ctrlInput lbAdd _text;
						_ctrlInput lbSetColor [_index,_color];
						_ctrlInput lbSetSelectColor [_index,_color];
					};
					case 1:{
						_ctrlInput lbSetTextRight [_index,_text];
						_ctrlInput lbSetColorRight [_index,_color];
						_ctrlInput lbSetSelectColorRight [_index,_color];
					};
					case 2:{
						_ctrlInput lbSetPicture [_index,_text];
						_ctrlInput lbSetPictureColor [_index,_color];
						_ctrlInput lbSetPictureColorSelected [_index,_color];
					};
					case 3:{
						_ctrlInput lbSetPictureRight [_index,_text];
						_ctrlInput lbSetPictureRightColor [_index,_color];
						_ctrlInput lbSetPictureRightColorSelected [_index,_color];
					};
				};
			} foreach [_textLData,_textRData,_iconLData,_iconRData];

			_ctrlInput lbSetTooltip [_index,_tooltip];
			_ctrlInput lbSetData [_index,_data];
			_ctrlInput lbSetValue [_index,_value];
		} forEach _items;

		_ctrlInput lbSetCurSel 0;
	};
	case "return":{
		_params params ["_display","_bool"];
		USE_CTRL(_ctrlInput,IDC_INPUT);
		private _code = _display getVariable [str _bool,{}];
		private _index = lbCurSel _ctrlInput;
		private _arguments = [
			_index,
			_ctrlInput lbData _index,
			_ctrlInput lbValue _index
		];
		_display closeDisplay 2;
		_arguments call _code;
	};
};