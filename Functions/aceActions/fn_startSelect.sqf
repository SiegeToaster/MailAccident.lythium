/*
 * Author: Siege
 * Description: Create the startSelect GUI
 *
 * Parameters: None
 *
 * Returns: None
*/

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
