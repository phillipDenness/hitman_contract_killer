_target=(_this select 0);
_shooter=(_this select 1);

sleep 2;

		if (alive _target and !incapacitated) 
				 then {
				null=[_shooter,true] execVM "setWanted.sqf";
					}else{
					if (incapacitated) then {
				 null=[_shooter,false] execVM "setWanted.sqf";
								};
					};