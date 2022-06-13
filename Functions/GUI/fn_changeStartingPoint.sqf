params ["_lbCtrl", "_index"];
_mapCtrl = ((findDisplay 1111) displayCtrl 561);

_mapCtrl ctrlMapAnimAdd [1, 0.35, getMarkerPos (_lbCtrl lbData _index)];
ctrlMapAnimCommit _mapCtrl;
