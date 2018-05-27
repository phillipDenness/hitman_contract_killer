private ["_waypoints","_findWps"];
_grpArray=(_this select 0);
_waypoints=(_this select 1);

_findWps = 4 +round(random 3);
if (_findWps > count _waypoints ) then {_findWps=(count _waypoints-1);};	

		{

_group=_x;
_group setBehaviour "SAFE";
_group setSpeedMode "LIMITED";	

	_EHkilledIdx = (leader _group) addEventHandler ["FiredNear", {_this call breakPatrol_FNC;}];
	
_waypoints=_waypoints call BIS_fnc_arrayShuffle;	
	for "_i" from 0 to (_findWps -1) do {
		_wpArray = _waypoints select _i;
		_wpPos = _wpArray select 0;
		_wp = _group addWaypoint [_wpPos, 10];
		_wp setWaypointType "MOVE";
		[_group,_i] setWaypointTimeout [0,2,4];
					};
					
	_wp1 = _group addWaypoint [(_waypoints select 0) select 0, 10];
	_wp1 setWaypointType "CYCLE";
		}foreach _grpArray;