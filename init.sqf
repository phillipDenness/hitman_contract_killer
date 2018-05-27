waitUntil {!isNil "BIS_fnc_init"};
if (!(isServer)) then {
waitUntil {!(isNull player)};
};

[] execVM "real_weather.sqf";

player addAction ["--Recover Database--","recoverScripts.sqf",[],0,false,false];