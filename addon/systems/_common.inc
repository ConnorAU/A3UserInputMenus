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

_display setVariable ["args",_args];
_display setVariable ["code",_code];
_display setVariable ["return",_return];
_ctrlTitle ctrlSetText _title;

private _ctrlButtonLShown = true;
if (_button2 isEqualType 0) then {
	_ctrlButtonL ctrlEnable false;
	_ctrlButtonL ctrlShow false;
	_ctrlButtonLShown = false;
} else {
	_ctrlButtonL ctrlSetText ([
		_button1,
		localize "STR_DISP_OK"
	] select (_button1 == ""));
};

if _ctrlButtonLShown then {
	_ctrlButtonL ctrlAddEventHandler ["ButtonClick",{
		USE_DISPLAY(ctrlParent(_this#0));
		[_display,true] call (_display getVariable ["return",{}]);
	}];
};
private _ctrlButtonRText = [_button1,_button2] select _ctrlButtonLShown;
_ctrlButtonR ctrlSetText ([
	_ctrlButtonRText,
	[
		localize "STR_DISP_OK",
		localize "STR_DISP_CANCEL"
	] select _ctrlButtonLShown
] select (_ctrlButtonRText in ["",0]));

_ctrlButtonR ctrlAddEventHandler ["ButtonClick",format["
	private _display = ctrlParent(_this#0);
	[_display,%1] call (_display getVariable ['return',{}]);
",!_ctrlButtonLShown]
];
_display displayAddEventHandler ["KeyDown",[
	{_this#1 == 1},
	{
		if (_this#1 == 1) then {
			[_this#0,false] call ((_this#0) getVariable ['return',{}]);
		};
	}
] select _ctrlButtonLShown];
