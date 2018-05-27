_target=(_this select 0);
_group=group _target;
_shooter=(_this select 1);

	_group setBehaviour "Combat";
	_group setSpeedMode "Normal";
	_index = currentWaypoint  _group;
	deleteWaypoint [_group, _index];
	
if (_shooter==player AND _target != TARGET) 
	then {
	 if (_target distance _shooter < 35) 
		then {
		 firedNear=firedNear+1;
			};
		};
			
if (_shooter == player and _target == TARGET) then {

	(_this select 0) removeAllEventHandlers "FiredNear";
	
	if (primaryWeapon _target == "") then {
	_target addWeapon "hgun_PDW2000_F";
	_target addmagazine "30Rnd_9x21_Mag";
	_target addmagazine "30Rnd_9x21_Mag";
	_target addmagazine "30Rnd_9x21_Mag";};

		 _wp = _group addWaypoint [position _shooter, 0,1];
		 _group setCurrentWaypoint [_group, 1];
		 [_group, 1] setWaypointBehaviour "Combat";
		 [_group, 1] setWaypointType "SAD";
		 [_group, 1] setWaypointCombatMode "RED";
	};
				

