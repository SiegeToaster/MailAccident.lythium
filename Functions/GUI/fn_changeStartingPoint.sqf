/*
 * Author: Siege
 * Description: Move GUI map to selected start point.
 *
 * Parameters:
 * 	0: Control of the listbox
 * 	1: Index of selected item
 *
 * Returns: None
 */

params ["_lbCtrl", "_index"];
private _mapCtrl = (findDisplay 1111) displayCtrl 561;

_mapCtrl ctrlMapAnimAdd [1, 0.35, getMarkerPos (_lbCtrl lbData _index)];
ctrlMapAnimCommit _mapCtrl;
