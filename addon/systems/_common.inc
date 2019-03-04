/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

// Common code used by all functions (saves copy pasting)
USE_DISPLAY(THIS_DISPLAY);
USE_CTRL(_ctrlBackground,IDC_BACKGROUND);
USE_CTRL(_ctrlTitle,IDC_TITLE);
USE_CTRL(_ctrlFooter,IDC_FOOTER);
USE_CTRL(_ctrlInput,IDC_INPUT);
USE_CTRL(_ctrlButtonL,IDC_BUTTONL);
USE_CTRL(_ctrlButtonR,IDC_BUTTONR);

_display setVariable ["true",_code1];
_display setVariable ["false",_code2];
_ctrlTitle ctrlSetText _title;
private _ctrlButtonLShown = true;
if (_button2 == "") then {
	if (str _code2 == "{}") then {
		_ctrlButtonL ctrlEnable false;
		_ctrlButtonL ctrlShow false;
		_ctrlButtonLShown = false;
	} else {
		_ctrlButtonL ctrlSetText ([
			_button1,
			localize "STR_DISP_OK"
		] select (_button1 == ""));
	};
} else {
	_ctrlButtonL ctrlSetText _button1;
};
if _ctrlButtonLShown then {
	_ctrlButtonL ctrlAddEventHandler ["ButtonClick",{["return",[ctrlParent(_this#0),true]] call THIS_FUNC}];
};
private _ctrlButtonRText = [_button1,_button2] select _ctrlButtonLShown;
_ctrlButtonR ctrlSetText ([
	_ctrlButtonRText,
	[
		localize "STR_DISP_OK",
		localize "STR_DISP_CANCEL"
	] select _ctrlButtonLShown
] select (_ctrlButtonRText == ""));
_ctrlButtonR ctrlAddEventHandler ["ButtonClick",
	format["['return',[ctrlParent(_this#0),%1]] call %2",!_ctrlButtonLShown,QUOTE(THIS_FUNC)]
];
_display displayAddEventHandler ["KeyDown",[
	{_this#1 == 1},
	{
		if (_this#1 == 1) then {
			["return",[_this#0,false]] call THIS_FUNC;
		};
	}
] select _ctrlButtonLShown];