_veh=(_this select 0);
_tempunit=(_this select 1);
_grp=(_this select 2);

	_vehPositions=[_veh] call BIS_fnc_vehicleRoles;

		{
	_currentPosition=_x;
	
	if (_currentPosition select 0 == "driver")then {
			_unit = _grp createUnit [_tempUnit, ASLtoATL getPosASL _veh, [], 0, "CAN_COLLIDE"];					
			_unit assignAsDriver _veh;
			_unit moveInDriver _veh;
			};
	
	if (_currentPosition select 0 == "turret")then {
			_unit2 = _grp createUnit [_tempUnit, ASLtoATL getPosASL _veh, [], 0, "CAN_COLLIDE"];
			_unit2 assignAsGunner _veh;
			_unit2 MoveInTurret [_veh,_currentPosition select 1];
			};
			
		}foreach _vehPositions;
	