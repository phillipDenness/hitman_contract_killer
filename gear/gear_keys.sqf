private ["_display","_displayTarget"];
disableSerialization;

_keys=(_this select 1);
	if (_keys == 30) then {null=[false,true] execVM "gear\selectGear.sqf";};
	if (_keys == 32) then {null=[true,true] execVM "gear\selectGear.sqf";};
	if (_keys == 17) then {null=[true,false] execVM "gear\selectGear.sqf";};
	if (_keys == 31) then {null=[false,false] execVM "gear\selectGear.sqf";};
	if (_keys == 28) then {
	player cameraEffect ["terminate","back"];
camDestroy cam;
gearFinish=true;
cutRsc ["Default", "PLAIN"];
};