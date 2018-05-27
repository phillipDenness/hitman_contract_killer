private ["_waypoints","_findWps"];
_grpArray=(_this select 0);
_waypoints=(_this select 1);
_findWps = 4 +round(random 3);
if (count _waypoints < _findWps) then {_findWps=(count _waypoints-1);};	

		{

_group=_x;
_group setBehaviour "SAFE";
_group setSpeedMode "LIMITED";	
	
_shuffleWaypoints=_waypoints call BIS_fnc_arrayShuffle;	
	for "_i" from 0 to _findWps do {
		_wp=_shuffleWaypoints select _i;
		_wp = _group addWaypoint [_wp, 10];
		_wp setWaypointType "MOVE";
		[_group,_i] setWaypointTimeout [0,2,4];
					};
					
	_wp1 = _group addWaypoint [_shuffleWaypoints select 0, 10];
	_wp1 setWaypointType "CYCLE";

		}foreach _grpArray;