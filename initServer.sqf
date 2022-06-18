#include "sia_f\core\initServer.sqf"
// DO NOT DELETE ^^^
// ADD YOUR OWN CODE BELOW vvv

{
missionNamespace setVariable [_x + "CanSetRally", true, true];
} forEach ["Alpha", "Bravo", "Charlie", "Command"];

