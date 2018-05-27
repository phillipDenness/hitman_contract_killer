private ["_aware"];
_target=(_this select 0);	
	_aware=false;
	while {alive _target and !_aware} do {
		if (player distance _target < 10 and !_aware) 
			then {
				if (currentWeapon player != "" and (vehicle player == player) and !_aware) 
				 exitwith {
				 _aware=true;
				0= [_target,player] call shotAtPlayer_fnc;
					};
				};
sleep 4;		
		};