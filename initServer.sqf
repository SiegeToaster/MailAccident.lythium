#include "sia_f\core\initServer.sqf"
// DO NOT DELETE ^^^
// ADD YOUR OWN CODE BELOW vvv

{
	missionNamespace setVariable [_x + "CanSetRally", true, true];
} forEach ["Alpha", "Bravo", "Charlie", "Command"];

hvt setPosATL getPosATL ([logic_hvtPos1, logic_hvtPos2] select round random 1);

{
	_x setMarkerAlpha 0;
} forEach ["mrk_hvtPos1", "mrk_hvtPos2", "mrk_hvt1", "mrk_hvt2", "mrk_insCamp"];
