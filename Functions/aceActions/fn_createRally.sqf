/*
 * Author: Siege
 * Description: Create rally point 1 meter in front of squad leader
 *
 * Parameters:
 *	0: Squad leader object
 *
 * Returns: None
*/

params ["_player"];

private _squad = _player getVariable "squad";
if (isNil "_squad") exitWith {};
// get timeout (must wait 5 minutes after placing rally to place a new one)
if (!isNil (_squad + "Spawn")) then {
	deleteVehicle (missionNamespace getVariable (_squad + "Spawn"))
};

_player playMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown";
missionNamespace setVariable [_squad + "CanSetRally", false, true];
[{
	params ["_player", "_squad"];
	private _spawnPos = _player modelToWorld [0, 1, 0];
	
	private _rally = "Misc_Backpackheap" createVehicle [_spawnPos # 0, _spawnPos # 1, 0];
	missionNamespace setVariable [_squad + "Spawn", _rally, true];

	[{
		missionNamespace setVariable [_this + "CanSetRally", true, true];
	}, _squad, 300 * timeMultiplier] call CBA_fnc_waitAndExecute;

	private _opforUnits = [];
	{
		if (alive _x && side _x == opfor) then { _opforUnits pushBack _x };
	} forEach allUnits;
	[
		{ { _x distance (_this # 0) < 100 } forEach (_this # 1) || isNull (_this # 0) },
		{ if (alive (_this # 0)) then { deleteVehicle (_this # 0) }; "1" remoteExec ["systemChat"]; /* code executed once condition is true */ },
		[_rally, _opforUnits],
		1200 /* rally burns after 20 mins */,
		{ deleteVehicle (_this # 0); "2" remoteExec ["systemChat"]; }
	] call CBA_fnc_waitUntilAndExecute;
}, [_player, _squad], 0.75 * timeMultiplier] call CBA_fnc_waitAndExecute;
