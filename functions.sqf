selectGear =  compile preprocessFile "gear\gear_keys.sqf";
spawnKeys =  compile preprocessFile "spawn_keys.sqf";
SHK_pos =  compile preprocessFile "SHK_pos.sqf";
shotAtPlayer_fnc = compile preprocessFileLineNumbers "shotAt.sqf";
fill_cargo = compile preprocessFileLineNumbers "eos_L\cargo_FNC.sqf";
eos_Init = compile preprocessFileLineNumbers "eos_L\eos_Init.sqf";
vehicleRoles = compile preprocessFileLineNumbers "eos_L\vehicleRoles.sqf";
injuryFNC = compile preprocessFileLineNumbers "injured.sqf";
innocentKilledFNC = compile preprocessFileLineNumbers "innocentKilled.sqf";
hitManKilledFNC = compile preprocessFileLineNumbers "hitmanKilled.sqf";

null = [] execVM "eos_L\eos_L_init.sqf";
null = [] execVM "cos\cosInit.sqf";