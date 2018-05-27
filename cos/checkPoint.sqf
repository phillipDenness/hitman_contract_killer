private ["_road","_roadlist","_isActive"];
_mkr=(_this select 0);
_pos=markerpos _mkr;
_grp=creategroup west;
_PatrolGrp=creategroup west;
_debug=false;
_trigID=format["trig%1", _mkr];
_roadList = if (count _this > 1) then {(_this select 1)}else{
_pos nearRoads 150;
};

_i=if (count _this > 2) then {(_this select 2)}else{0};
 _road=(_roadlist select _i);
	if (count (roadsConnectedTo _road) < 2) then {_road=(_roadlist select 1);};
	_currentRoad=_road;
	 _roadConnectedTo = roadsConnectedTo _currentRoad;
	_connectedRoad = _roadConnectedTo select 1;
	_direction = [_currentRoad, _connectedRoad] call BIS_fnc_DirTo;

_bunker = createVehicle ["Land_BagBunker_Small_F", _currentRoad, [], 0, "CAN_COLLIDE"];
_bunker setPos [(getPos _bunker select 0)-6, getPos _bunker select 1, getPos _bunker select 2];
_bunker setdir (_direction + 180);

_veh = createVehicle ["C_Offroad_01_F", _currentRoad, [], 0, "CAN_COLLIDE"];
_veh setPos [(getPos _veh select 0)-4, (getPos _veh select 1)+6, getPos _veh select 2];
_veh setdir _direction;

_checkPointPool=["B_recon_exp_F","B_Soldier_A_F","B_engineer_F","B_Soldier_F","B_Soldier_AAR_F","B_Soldier_AAT_F"];
_checkPointPool=_checkPointPool call BIS_fnc_arrayShuffle;

for "_i" from 0 to 1 do {
	_p = _bunker buildingpos _i;
	_tempUnit=_checkPointPool select _i;
		_unit = _grp createUnit [_tempUnit, _p, [], 0, "NONE"];
		 _unit setdir _direction;
		 _unit disableAI "move";
		 _unit setunitpos "UP";
			_mags = vestItems _unit;
				removeVest _unit;
				 _unit addvest "V_TacVest_blk_POLICE";
				{_unit addItemToVest _X;}foreach _mags;
				
		_mags = uniformItems _unit;
		removeUniform _unit;
		_unit Adduniform "U_B_CTRG_1";
		{_unit addItemToUniform _X;}foreach _mags;
					 
removebackpack _unit;
_unit unassignItem "NVGoggles";
_unit removeItem "NVGoggles";
	_unit setSkill ["aimingspeed", 0.1];
	_unit setSkill ["spotdistance", 0.1];
	_unit setSkill ["aimingaccuracy", 0.1];
	_unit setSkill ["aimingshake", 0.05];
	_unit setSkill ["spottime", 0.3];
	_unit setSkill ["spotdistance", 0.4];
	
null = [_unit] execVM "addaction.sqf";	
	};
	
for "_i" from 1 to 4 do {
	_tempUnit=_checkPointPool select _i;
		_unit = _PatrolGrp createUnit [_tempUnit, _road, [], 0, "NONE"];
		
			_mags = vestItems _unit;
				removeVest _unit;
				 _unit addvest "V_TacVest_blk_POLICE";
				{_unit addItemToVest _X;}foreach _mags;
				
		_mags = uniformItems _unit;
		 removeUniform _unit;
		 _unit Adduniform "U_B_CTRG_1";
		{_unit addItemToUniform _X;}foreach _mags;
		
removebackpack _unit;
_unit unassignItem "NVGoggles";
_unit removeItem "NVGoggles";
	_unit setSkill ["aimingspeed", 0.1];
	_unit setSkill ["spotdistance", 0.1];
	_unit setSkill ["aimingaccuracy", 0.1];
	_unit setSkill ["aimingshake", 0.05];
	_unit setSkill ["spottime", 0.3];
	_unit setSkill ["spotdistance", 0.4];
	
null = [_unit] execVM "addaction.sqf";
};

null=[_PatrolGrp,_roadlist]execVM "simplePatrol.sqf";

if _debug then {
		_name=format ["Bunker%1,%2",_mkr,_grp];
		_txt=format ["Bunker %1",_mkr];
		_mkr=createMarker [_name,_currentRoad];
		_mkr setMarkerShape "ICON";
		_mkr setMarkerType "hd_dot";
		_mkr setMarkerText _txt;
			};
			
sleep 0.1;			
_veh animate ["HideServices", 1]; 
_veh animate ["HideBackpacks", 1]; 
_veh animate ["HideBumper1", 0]; 
_veh animate ["HideBumper2", 0]; 
_veh animate ["HideConstruction", 1]; 
_veh animate ["HideDoor1", 0];  
_veh animate ["HideDoor2", 0]; 
_veh animate ["HideDoor3", 0]; 
_veh animate ["HideGlass2", 1];
_veh animate ["HidePolice", 0]; 

_isActive=server getvariable _trigID;

// Check every second until trigger is deactivated
 while {_isActive} do
		{
	_isActive=server getvariable _trigID;
		if (!_isActive) exitwith {};
		sleep 1;
		};
		 
// CHECK VEHICLE IS NOT TAKEN BY PLAYER
	if ({isPlayer _veh} count (crew _veh) == 0) 
	 then {
	{deleteVehicle _x} forEach (crew _veh); deleteVehicle _veh;
		}; 
	deletevehicle _bunker;
	{ deleteVehicle _x } forEach units _grp;
	{ deleteVehicle _x } forEach units _PatrolGrp;
	deleteGroup _PatrolGrp;  
	deleteGroup _grp;  