/*
 * Author: Siege
 * Description: Assigns start point to squad.
 *
 * Parameters: None
 *
 * Returns: None
 */

private _squadLbCtrl = (findDisplay 1111) displayCtrl 1501;
private _startLbCtrl = (findDisplay 1111) displayCtrl 1500;

private _squadName = _squadLbCtrl lbText (lbCurSel _squadLbCtrl);
private _startName = _startLbCtrl lbText (lbCurSel _startLbCtrl);

private _startNum = _startName select [count _startName - 1, 1];

missionNamespace setVariable [_squadName, _startNum, true];

closeDialog 1;
