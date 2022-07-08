#include "sia_f\core\initPlayerLocal.sqf"
// DO NOT DELETE ^^^
// ADD YOUR OWN CODE BELOW vvv

waitUntil { !isNil "sia_f_missionStarted" };

// start select
private _startSelectAction = [
	"startSelect",
	"Choose Starting Point",
	"",
	{ call MailAccident_fnc_startSelect; },
	{ !sia_f_missionStarted },
	{},
	[],
	[0, 0, 0],
	10
] call ace_interact_menu_fnc_createAction;
{
	[_x, 0, ["ACE_MainActions"], _startSelectAction] call ace_interact_menu_fnc_addActionToObject;
} forEach [mapInteract1, mapInteract2];

// rally system
private _createRallyAction = [
	"createRally",
	"Place Rally Point",
	"",
	{ [_player] call MailAccident_fnc_createRally; },
	{ sia_f_missionStarted && ((_player getVariable "role") in ["sql", "pltco"]) && (missionNamespace getVariable ((_player getVariable "squad") + "CanSetRally")) }
] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "SIA"], _createRallyAction] call ace_interact_menu_fnc_addActionToClass;

private _tpToRallyAction = [
	"tpToRally",
	"Teleport to Rally Point",
	"",
	{ [_player] call MailAccident_fnc_tpToRally },
	{ sia_f_missionStarted }
] call ace_interact_menu_fnc_createAction;
{
	[_x, 0, ["ACE_MainActions"], _tpToRallyAction] call ace_interact_menu_fnc_addActionToObject;
} forEach sia_f_ACEButtons;

// intel
private _mainIntelAction = [
	"mainIntelAction",
	"Pickup Intel",
	"",
	{
		params ["_target", "_player"];
		_player playMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown";
		deleteVehicle _target;
		{ _x setMarkerAlpha 1; } forEach ["mrk_hvtPos1", "mrk_hvtPos2"];
		[_player, "This intel contains information on the HVT's location.  I should mark these locations on my map."] remoteExec ["sideChat"];
	},
	{ true }
] call ace_interact_menu_fnc_createAction;
[mainIntel, 0, ["ACE_MainActions"], _mainIntelAction] call ace_interact_menu_fnc_addActionToObject;

private _campIntelAction = [
	"campIntelAction",
	"Pickup Intel",
	"",
	{
		params ["_target", "_player"];
		_player playMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown";
		deleteVehicle _target;
		"mrk_insCamp" setMarkerAlpha 1;
		[_player, "This intel contains information on an insurgent camp.  I should mark its positions on my map."] remoteExec ["sideChat"];
	},
	{ true }
] call ace_interact_menu_fnc_createAction;
[campIntel, 0, ["ACE_MainActions"], _campIntelAction] call ace_interact_menu_fnc_addActionToObject;

private _hvt1IntelAction = [
	"hvt1IntelAction",
	"Pickup Intel",
	"",
	{
		params ["_target", "_player"];
		_player playMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown";
		deleteVehicle _target;
		"mrk_hvt1" setMarkerAlpha 1;
		[_player, "This unsecured laptop says that the HVT is within 1 kilometer of this camp.  I should mark this information on my map."] remoteExec ["sideChat"];
	},
	{ true }
] call ace_interact_menu_fnc_createAction;
[hvt1Intel, 0, ["ACE_MainActions"], _hvt1IntelAction] call ace_interact_menu_fnc_addActionToObject;

private _hvt2IntelAction = [
	"hvt2IntelAction",
	"Pickup Intel",
	"",
	{
		params ["_target", "_player"];
		_player playMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown";
		deleteVehicle _target;
		"mrk_hvt2" setMarkerAlpha 1;
		[_player, "This notepad says that the informant saw a lot of insurgent vehicles moving north on the nearby road.  I should mark this information on my map."] remoteExec ["sideChat"];
	},
	{ true }
] call ace_interact_menu_fnc_createAction;
[hvt2Intel, 0, ["ACE_MainActions"], _hvt2IntelAction] call ace_interact_menu_fnc_addActionToObject;