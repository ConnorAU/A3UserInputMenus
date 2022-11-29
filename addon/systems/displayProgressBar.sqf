/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define DISPLAY_NAME CAU_UserInputMenus_displayProgressBar

#include "_macros.inc"
#include "_defines.inc"

#define VAR(suffix) QUOTE(JOIN(DISPLAY_NAME,JOIN(_,suffix)))
#define SVAR(n,v) _parentDisplay setVariable [VAR(n),v]
#define GVAR(n,v) (_parentDisplay getVariable [VAR(n),v])

params [
	["_parameters",[],[[]]],
	["_title","Progress",[""]],
	["_code",{},[{},[]]],
	["_parentDisplay",displayNull,[displayNull]]
];
_parameters params [
	["_duration",0,[0]],
	["_image","",[""]],
	["_overlay",true,[true]],
	["_arguments",[]],
	["_condition",{},[{}]],
	["_onProgress",{},[{}]]
];
_code params [["_code",{},[{}]],["_args",[],[[]]]];

if (_duration <= 0) exitWith {["Duration too short: %1",_duration] call BIS_fnc_error};

// Create display
disableSerialization;
if (isNull _parentDisplay) then {_parentDisplay = findDisplay 46};
if !_overlay then {
	_parentDisplay = _parentDisplay createDisplay "RscDisplayEmpty";
	_parentDisplay ctrlCreate ["ctrlStaticBackgroundDisableTiles",-1];
};
private _display = _parentDisplay ctrlCreate ["CAU_UserInputMenus_displayProgressBar",-1];
if (isNull _display) exitWith {["Unable to create display on parent: %1",_parentDisplay] call BIS_fnc_error};

// Prepare user interface
private _ctrlImage = _display getVariable ["ctrlImage",controlNull];
private _ctrlText = _display getVariable ["ctrlText",controlNull];
private _ctrlButton = _display getVariable ["ctrlButton",controlNull];

_ctrlText ctrlSetText format["%1 (0%2)",_title,"%"];
if (_image != "") then {
	_ctrlImage ctrlSetText _image;

	private _ctrlImagePos = ctrlPosition _ctrlImage;
	private _ctrlTextPos = ctrlPosition _ctrlText;

	_ctrlText ctrlSetPositionX (_ctrlTextPos#0 + _ctrlImagePos#2);
	_ctrlText ctrlSetPositionW (_ctrlTextPos#2 - _ctrlImagePos#2);
	_ctrlText ctrlCommit 0;
};

if _overlay then {
	_ctrlButton ctrlShow false;
} else {
	_ctrlText ctrlSetPositionW (ctrlPosition _ctrlText#2 - ctrlPosition _ctrlButton#2);
	_ctrlText ctrlCommit 0;

	_ctrlButton ctrlAddEventHandler ["ButtonClick",{
		private _parentDisplay = ctrlParent(_this#0);
		1 call GVAR(exit,{});
	}];
};

_parentDisplay displayAddEventHandler ["Unload",{
	params ["_parentDisplay","_code"];
	if (_code == 2) then {1 call GVAR(exit,{})};
}];

// Define exit function
private _exit = {
	USE_DISPLAY(THIS_DISPLAY);
	private _parentDisplay = ctrlParent _display;

	private _args = GVAR(args,[]);
	private _code = GVAR(code,{});

	removeMissionEventHandler ["EachFrame",GVAR(eachFrameID,-1)];
	if GVAR(overlay,true) then {
		ctrlDelete _display;
		// wipe variables from parent display because we aren't closing it
		SVAR(args,nil);
		SVAR(code,nil);
		SVAR(arguments,nil);
		SVAR(condition,nil);
		SVAR(onProgress,nil);
		SVAR(exit,nil);
		SVAR(title,nil);
		SVAR(duration,nil);
		SVAR(startTick,nil);
		SVAR(overlay,nil);
		SVAR(eachFrameID,nil);
	} else {
		_parentDisplay closeDisplay 0;
	};

	[_this == 0,_args,_code] call {
		// Wiping inherited local variables from scope
		private ["_parentDisplay","_display","_canProgress","_progress","_ctrlBackground","_ctrlBar","_ctrlText","_code","_args"];
		params ["_completed"];
		(_this#1) call (_this#2);
	};
};

// Save data to parent display
SVAR(args,_args);
SVAR(code,_code);
SVAR(arguments,_arguments);
SVAR(condition,_condition);
SVAR(onProgress,_onProgress);
SVAR(exit,_exit);
SVAR(title,_title);
SVAR(duration,_duration);
SVAR(startTick,diag_tickTime);
SVAR(overlay,_overlay);

// Add update event
private _eachFrameID = addMissionEventHandler ["EachFrame",{
	disableSerialization;
	USE_DISPLAY(THIS_DISPLAY);
	private _parentDisplay = ctrlParent _display;

	// canProgress if condition returns nil or true
	private _canProgress = [GVAR(arguments,[]),GVAR(condition,{})] call {
		// Wiping inherited local variables from scope
		private ["_display","_parentDisplay"];
		(_this#0) call (_this#1);
	};
	if (!isNil "_canProgress" && {!(_canProgress isEqualType true) || {!_canProgress}}) exitWith {1 call GVAR(exit,{})};

	GVAR(onProgress,{}) call {
		// Wiping inherited local variables from scope
		private ["_display","_parentDisplay","_canProgress"];
		[] call _this;
	};

	// Calculate progress value.
	// _duration default is diag_tickTime to avoid zero divisor errors, and assume progress is complete if the variables are nil
	private _progress = ((diag_tickTime - GVAR(startTick,0))/GVAR(duration,diag_tickTime)) min 1;

	// Update controls
	private _ctrlBackground = _display getVariable ["ctrlBackground",controlNull];
	private _ctrlBar = _display getVariable ["ctrlBar",controlNull];
	private _ctrlText = _display getVariable ["ctrlText",controlNull];

	_ctrlBar ctrlSetPositionW ((ctrlPosition _ctrlBackground # 2)*_progress);
	_ctrlBar ctrlCommit 0;
	_ctrlText ctrlSetText format["%1 (%2%3)",GVAR(title,"Progress"),ceil(_progress*100),"%"];

	// Exit if complete
	if (_progress == 1) then {0 call GVAR(exit,{})};
}];
SVAR(eachFrameID,_eachFrameID);
