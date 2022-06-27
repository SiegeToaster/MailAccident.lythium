/*
 * Author: Siege
 * Description: TP player to their squad's rally point
 * 				Borrows effects from McKendrick's teleportToSquad script
 *
 * Parameters:
 * 	0: Player to teleport object
 *
 * Returns: None
*/

params ["_player"];

private _squad = _player getVariable "squad";
if (isNil "_squad") exitWith {
	0 spawn {
		1 cutText ["Teleport failed, failed to find squad.", "PLAIN", -1, true];
		sleep 1.5;
		1 cutText ["","PLAIN",-1,true];
	};
};

if (isNil (_squad + "Spawn")) exitWith {
	0 spawn {
		1 cutText ["Teleport failed, no rally point.", "PLAIN", -1, true];
		sleep 1.5;
		1 cutText ["","PLAIN",-1,true];
	};
};

private _rally = missionNamespace getVariable (_squad + "Spawn");
0 spawn {
	1 cutText ["Teleporting...", "PLAIN", -1, true];
	sleep 0.5;	
	2 cutText ["", "BLACK OUT", 1];
	sleep 1;

	_player setPosATL (getPosATL _rally);

	sleep 0.5;
	2 cutText ["", "BLACK IN", .5];
	1 cutText ["", "PLAIN", -1, true];
};