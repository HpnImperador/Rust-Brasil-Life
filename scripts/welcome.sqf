/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
_onScreenTime = 5.1;

waitUntil {alive player}; //Hold the script here until the player has spawned.

_role1 = "Olá!";
_role1names = ["Seja bem Vindo!"];
_role2 = "Entre em nosso Teamspeak";
_role2names = ["nuclearwar.ts3gamer.com.br"];
{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.50' color='#cc9900' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.95,0.50], //DEFAULT: 0.95,0.50
		[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
	[_role1, _role1names],
	[_role2, _role2names]
];