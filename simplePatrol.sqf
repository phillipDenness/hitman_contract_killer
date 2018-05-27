private ["_wps","_roadlist","_wp","_findWps"];
_grp = (_this select 0);
_leader=leader _grp;
_wps = 3;
_grp setBehaviour "SAFE";
_grp setSpeedMode "LIMITED";
_debug=false;

if (count _this > 1) then {_roadlist = (_this select 1);
		}else{
	_roadlist = getpos _leader nearRoads 100;
	};
	
_n=0;
_rad=50;
	while {count _roadlist < (_wps+2)} do {
		_rad=_rad+_rad;
		_roadlist= getpos _leader nearRoads _rad;
			sleep 0.1;
				};
				
// Create waypoints
for "_i" from 1 to _wps do {
	_currentRoad=_roadlist select _i;
    _wp = _grp addWaypoint [_currentRoad, 10,_i];
    _wp setWaypointType "MOVE";
    [_grp,_i] setWaypointTimeout [0,2,2];
	
	if _debug then {
		_name=format ["Waypoint %1,%2",_i,_grp];
		_txt=format ["Waypoint %1",_i];
		_mkr=createMarker [_name,_currentRoad];
		_mkr setMarkerShape "ICON";
		_mkr setMarkerType "hd_dot";
		_mkr setMarkerText _txt;
		};
};

_wp1 = _grp addWaypoint [_roadlist select 0,10];
_wp1 setWaypointType "CYCLE";


if _debug then {
		_txt=format ["Cycle%1",_grp];
		_mkr=createMarker [_txt,_roadlist select 0];
		_mkr setMarkerShape "ICON";
		_mkr setMarkerType "hd_dot";
		_mkr setMarkerText _txt;
			};
			