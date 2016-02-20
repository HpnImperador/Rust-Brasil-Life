waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
*/
//_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
//_rscLayer cutRsc["osefStatusBar","PLAIN"];
4 cutRsc ["osefStatusBar","PLAIN"];

[] spawn {
	uiSleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		uiSleep 1;
		_uptime = [time,"HH:MM:SS"] call BIS_fnc_secondsToString;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetStructuredText parseText format["|| <t color='#FFFFFF'>Cops: %1</t> | <t color='#FFFFFF'>Civs: %2</t> | <t color='#FFFFFF'>Medics: %3</t> | <t color='#FFFFFF'>FPS: %4</t> ||", west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits, round diag_fps, serverTime];
	};
};