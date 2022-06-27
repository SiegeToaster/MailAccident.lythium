#include "sia_f\core\initPlayerLocal.sqf"
// DO NOT DELETE ^^^
// ADD YOUR OWN CODE BELOW vvv

waitUntil { !isNil "sia_f_missionStarted" };

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
