/*
    GrenadeStop v0.8 for ArmA 3 Alpha by Bake (tweaked slightly by Rarek)
    
    DESCRIPTION:
    Stops players from throwing grenades in safety zones.
    
    CONFIGURATION:
    Edit the #defines below.
*/

#define SAFETY_ZONES [["safe_area_1", 250],["safe_area_2", 35],["safe_area_3", 100],["safe_area_4", 50],["safe_area_5", 45],["safe_area_6", 50],["safe_area_7", 150],["safe_area_8", 60]] // Syntax: [["marker1", radius1], ["marker2", radius2], ...]
#define MESSAGE "Você está em uma safe zone, é proibido atirar, matar ou cometer crimes aqui, passível de BAN!"

     if (isDedicated) exitWith {};
     waitUntil {!isNull player};

switch (playerSide) do
{
	case west:
	{
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
				_x allowDamage false;
			};
	};
	
	case civilian:
	{


     player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
				 deleteVehicle (_this select 6);
				 titleText [MESSAGE, "PLAIN", 3];
             };
        }];  
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
				_x allowDamage false;
			};
	};
	
	case independent:
	{

     player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
				 deleteVehicle (_this select 6);
				 titleText [MESSAGE, "PLAIN", 3];
             };
        }];  
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
				_x allowDamage false;
			};
	};
};
