if (!isServer) exitWith {};
private ["_cargoPool","_emptySeats","_veh","_debug","_grp","_grpSize"];
	_veh=(_this select 0);
	_grpSize=(_this select 1);
	_grp=(_this select 2);
	_cargoPool=(_this select 3);
	_debug=false;

// FILL EMPTY SEATS		
	_emptySeats=_veh emptyPositions "cargo";
	if (_debug) then {hint format ["%1",_emptySeats];};

// IF VEHICLE HAS SEATS	
		if (_emptySeats > 0) then {
		
// LIMIT SEATS TO FILL TO GROUP SIZE		
			if 	(_grpSize > _emptySeats) then {_grpSize = _emptySeats};					
						if (_debug) then {hint format ["Seats Filled : %1",_grpSize];};	
									
						for "_x" from 1 to _grpSize do {					
								_tempUnit=_cargoPool select _x;
								_unit = _grp createUnit [_tempUnit, ASLtoATL getPosASL _veh, [], 0, "CAN_COLLIDE"];
								_unit moveincargo _veh;
								};
			};						
