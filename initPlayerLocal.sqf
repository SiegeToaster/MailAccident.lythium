#include "sia_f\core\initPlayerLocal.sqf"
// DO NOT DELETE ^^^
// ADD YOUR OWN CODE BELOW vvv

waitUntil { !isNil "sia_f_missionStarted" };

private _statement = {
	createDialog "startSelect";

	private _ctrl = (findDisplay 1111) displayCtrl 1500;
	for "_i" from 1 to 3 do {
		private _index = _ctrl lbAdd ("Start Point " + str _i);
		_ctrl lbSetData [_index, "mrk_start" + str _i];
	};
	_ctrl lbSetCurSel 0;

	_ctrl = (findDisplay 1111) displayCtrl 1501;
	{
		_ctrl lbAdd _x;
	} forEach ["Alpha", "Bravo", "Charlie", "Command"];
	_ctrl lbSetCurSel 0;
};

private _action = ["startSelect", "Choose Starting Point", "", _statement, { !sia_f_missionStarted }, {}, [], [0, 0, 0], 10] call ace_interact_menu_fnc_createAction;
{
	[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach [mapInteract1, mapInteract2];
