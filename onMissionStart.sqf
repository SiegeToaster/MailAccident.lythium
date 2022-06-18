// server only
#define GET_GROUP(suffix) (missionNamespace getVariable (_grpName + "_" + suffix))

#define SP1_D (235 + random [-45, 0, 45])
#define SP2_D (340 + random [-45, 0, 45])
#define SP3_D (190 + random [-45, 0, 45])

{
	private _grpName = _x;
	missionNamespace setVariable ["grp" + _grpName, []];
	{
		(missionNamespace getVariable ["grp" + _grpName, []]) append units _x;
	} forEach [GET_GROUP("L"), GET_GROUP("1"), GET_GROUP("2")];
} forEach ["Alpha", "Bravo", "Charlie"];
grpCommand = units Plt_Co;

[0, {
	2 cutText ["Mission Starting...", "PLAIN", -1, true];
	sleep 0.5;	
	1 cutText ["", "BLACK OUT", 1];
	sleep 4;

	2 cutText ["", "BLACK IN", 3];
	1 cutText ["","PLAIN", -1, true];
}] remoteExec ["spawn"];

sleep 2;

private _randomStartHelper = ceil random 3; // there is a possibility of this and _startPoint being 0, but it is negligible.
// needs to be the same for all groups otherwise there is a chance that two groups could spawn in the same place.
{
	private _fullGrp = missionNamespace getVariable ("grp" + _x);
	if (count _fullGrp <= 0) then { continue };
	private _grpName = _x;

	private _selectedStart = missionNamespace getVariable [_x, "1"];
	private _startPoint = missionNamespace getVariable ("logic_sp" + _selectedStart + "_" + str (_forEachIndex + _randomStartHelper /* Prevents two squads being put in the same exact place */));
	_startPoint = getPosWorld _startPoint; // getPosWorld is supposedly the fastest getPos command and serves this purpose (https://community.bistudio.com/wiki/Code_Optimisation#getPos.2A_and_setPos.2A)

	private "_pointMan";
	if (_x == "Command") then {
		if (count units Plt_Co > 0) then { _pointMan = leader Plt_Co };
	} else {
		{
			private _grp = GET_GROUP(_x);
			if (count units _grp <= 0) then { continue };
			_pointMan = leader _grp;
			break;
		} forEach ["L", "1", "2"];
	}; // establish likely leader of squad and set at front

	_pointMan setPosATL [_startPoint # 0, _startPoint # 1, 0];
	_pointMan setDir ([SP1_D, SP2_D, SP3_D] select ((parseNumber _selectedStart) - 1));
	_pointMan playActionNow (["PlayerStand", "PlayerCrouch"] # round random 1);
	{
		private _pythagDistance = 6 * (ceil (_forEachIndex + 1 / 2));
		_pythagDistance = _pythagDistance / (sqrt 2); // https://en.wikipedia.org/wiki/Special_right_triangle#45%C2%B0%E2%80%9345%C2%B0%E2%80%9390%C2%B0_triangle

		private _newPos = _pointMan modelToWorld [(_pythagDistance) * [1, -1] # (_forEachIndex % 2), _pythagDistance * -1, 0];
		/* to explain the _newPos calculation:
		 * The goal was to space the units 6 meters away from one another at a 45 degree angle away from the pointman
		 * ceil (_forEachIndex / 2) determines the "row" number (how many places behind the pointman)
		 * this is added by one to prevent a distance of 0 and multiplied by 6 to make it 6 meters away from one another
		 * to account for the 45 degree thing, this is divided by sqrt(2); see the wiki link on special right triangles
		 * the model to world command is used to make the position relative to the pointman
		 * the [1, -1] # (_forEachIndex % 2) makes even indexes go on the right of the wedge, and odds go on the left
		 * the 2nd * -1 is to have the units behind the pointman instead of in front
		 *
		 * not perfect, and probably extremely over complicated, but it'll do.
		*/

		_x setPosATL [_newPos # 0, _newPos # 1, 0];
		_x setDir ([SP1_D, SP2_D, SP3_D] select ((parseNumber _selectedStart) - 1));
		_x playActionNow (["PlayerStand", "PlayerCrouch"] # round random 1);
	} forEach (_fullGrp - [_pointMan]);
} forEach ["Alpha", "Bravo", "Charlie", "Command"];
