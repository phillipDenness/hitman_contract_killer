if (isServer) then {
private ["_tempVeh","_tempUnit","_n","_v","_tempPos","_infgroups","_lightVeh","_heavyVeh","_UnitList","_saveCounter","_houseCount","_houseGrps"];
_mkr= (_this select 0);
_faction=(_this select 1);

_var= format ["eosClear%1",_mkr];
if (!(server getvariable _var)) then {

_zoneVar=format["zInfo%1%2",_mkr,_faction];
_zoneInfo=server getvariable _zoneVar;

_vehList= (_zoneInfo select 0);
_UnitList=(_zoneInfo select 1);
_HvehList=(_zoneInfo select 2);
_grpSize=(_zoneInfo select 3);
_lVgrpSize=(_zoneInfo select 4);
_HVgrpSize=(_zoneInfo select 5);
_posArray=(_zoneInfo select 6);
_HSEgrpSize=(_zoneInfo select 7);
_buildingPositions=(_zoneInfo select 8);
_roadPosArray=(_zoneInfo select 9);
_side=(_zoneInfo select 10);

// Get trigger status
_trigID=format["trig%1%2", _mkr,_faction];
_isActive=server getvariable _trigID;

// Get latest variables	
_cacheVar=format["Cache%1%2",_mkr,_faction];
_cacheInfo=server getvariable _cacheVar;	
	_infgroups=(_cacheInfo select 0);
	_lightVeh=(_cacheInfo select 1);
	_heavyVeh=(_cacheInfo select 2);
	_houseGrps=(_cacheInfo select 3);
	
	
	if (debugEOS_L) then {
player sidechat (format ["Loading:%4|%5,HSE:%6 ,INF:%1 ,Lveh:%2 ,Hveh:%3",_infgroups,_lightVeh,_heavyVeh,_mkr,_side,_houseGrps]);	
				};
_showPos=false;				
	IF (_showPos) 
		then {
			{
	_txt=format["posEOS_L%1",_x];
	_debugMkr=createMarker [_txt, _x];
	_debugMkr setMarkerShape "ICON";
	_debugMkr setMarkerType "hd_dot";
			}foreach _posArray;
		};
		
// If 0 groups then setvariable and change marker color to green
 if ((_infgroups + _lightVeh + _heavyVeh + _houseGrps) == 0) 
	then {
 _var= format ["eosClear%1",_mkr];
 server setvariable [_var,true];
 server setvariable [_trigID,false];
	_mkr setmarkercolor "colorGreen";	
 
	if (debugEOS_L) then {player sidechat (format ["Zone:%1 | No enemy presence detected",_mkr]);};
};
		
waituntil {!populating_EOS and !populating_COS};
_countVehPool=count _vehList;_countPool=count _UnitList;_countHVehPool=count _HvehList;
_vehPatrolArray=[];_vehicleArray=[];_HeavyArray=[];_infArray=[];_hosArray=[];
_v=0;_n=0;_posCount=0;_rdCount=0;_houseCount=0;
//needed=[_vehList,_UnitList,_HvehList,_buildingPositions,_posArray,_roadPosArray];
// Spawn house Groups
for "_i" from 1 to _houseGrps do {
	if (!(server getvariable _trigID)) exitwith {_isActive=false;};
							
	
	_grp=createGroup _side;	
		for "_i" from 1 to _HSEgrpSize do {
		_tempPos = _buildingPositions select _houseCount;
		_houseCount=_houseCount+1;
			
			
			if (_i >= _countPool) 
				then {
			 if (_n >= _countPool) then {_n=0;};
				_UnitList=_infPool call BIS_fnc_arrayShuffle;
				_tempUnit=_UnitList select _n;
				_n=_n+1;
				 };
				 
			 if (_i < _countPool) 
				then {
				_tempUnit=_UnitList select _i;
					};
					
			_unit = _grp createUnit [_tempUnit, [0,0,0], [], 15, "NONE"];
				_unit setpos _tempPos;
				 doStop _unit; 
				_unit setunitpos "UP";

				null=[_unit] execVM "addaction.sqf";
				
	_unit setSkill ["aimingspeed", 0.1];
	_unit setSkill ["spotdistance", 0.1];
	_unit setSkill ["aimingaccuracy", 0.05];
	_unit setSkill ["aimingshake", 0.05];
	_unit setSkill ["spottime", 0.2];
	_unit setSkill ["spotdistance", 0.4];
	_unit setSkill ["commanding", 0.4];
	_unit setSkill ["general", 0.3];					
							
							sleep 0.1;};
											
					_hosArray set [count _hosArray,_grp];
				
					};
	
// Spawn Groups
for "_i" from 1 to _infgroups do {
	if (!(server getvariable _trigID)) exitwith {_isActive=false;};
							
	_tempPos = _posArray select _posCount;
	_posCount=_posCount+1;	
	_grp=createGroup _side;	

	for "_i" from 1 to _grpSize do {
		
		if (_i >= _countPool) 
			then {
		 if (_n >= _countPool) then {_n=0;};
			_UnitList=_infPool call BIS_fnc_arrayShuffle;
			_tempUnit=_UnitList select _n;
			_n=_n+1;
				};
				
		if (_i < _countPool) 
			then {
			_tempUnit=_UnitList select _i;
				};
					
	_unit = _grp createUnit [_tempUnit, _tempPos, [], 15, "NONE"];
	null=[_unit] execVM "addaction.sqf";

	_unit setSkill ["aimingspeed", 0.1];
	_unit setSkill ["spotdistance", 0.1];
	_unit setSkill ["aimingaccuracy", 0.05];
	_unit setSkill ["aimingshake", 0.05];
	_unit setSkill ["spottime", 0.2];
	_unit setSkill ["spotdistance", 0.4];
	_unit setSkill ["commanding", 0.4];
	_unit setSkill ["general", 0.3];	
			
									sleep 0.1;};	
									
_infArray set [count _infArray,_grp];
					

		};
	
// SPAWN VEHICLES
for "_i" from 1 to _lightVeh do {

if (!(server getvariable _trigID)) exitwith {_isActive=false;};

		if (_i >= _countVehPool) 
			then {
		 if (_v >= _countVehPool) then {_v=0;};
			 _tempVeh=_vehList select _v;
			 _v=_v+1;
				};
		if (_i < _countVehPool) 
			then {
			_tempVeh=_vehList select _i;
				};
		if (_i >= _countPool) 
			then {
		 if (_n >= _countPool) then {_n=0;};
			 _UnitList=_infPool call BIS_fnc_arrayShuffle;
			 _tempUnit=_UnitList select _n;
			 _n=_n+1;
				};
		if (_i < _countPool) 
			then {
			_tempUnit=_UnitList select _i;
				};
				
		_roadInfo=_roadPosArray select _rdCount;		
		_tempPos=_roadInfo select 0;
		_direction=_roadInfo select 1;
		_rdCount=_rdCount+1;		
		
		_grp = createGroup _side;					
		_veh = createVehicle [_tempVeh, _tempPos, [], 0, "NONE"];
		_veh setdir _direction;
			0=[_veh,_tempUnit,_grp]call vehicleRoles;

				
	if (_lVgrpSize>0) then {
		0=[_veh,_lVgrpSize,_grp,_UnitList] call fill_cargo;	
						};
	{null=[_x] execVM "addaction.sqf";
	_x setSkill ["aimingspeed", 0.1];
	_x setSkill ["spotdistance", 0.1];
	_x setSkill ["aimingaccuracy", 0.05];
	_x setSkill ["aimingshake", 0.05];
	_x setSkill ["spottime", 0.2];
	_x setSkill ["spotdistance", 0.4];
	_x setSkill ["commanding", 0.4];
	_x setSkill ["general", 0.3];	
	}foreach units _grp;
	null=[_veh] execVM "addactionVeh.sqf";

		_vehPack=[_veh,_grp];
		_vehPatrolArray set [count _vehPatrolArray,_grp];
		_vehicleArray set [count _vehicleArray,_vehPack];				
		};
			
// SPAWN ARMOURED VEHICLES
for "_i" from 1 to _heavyVeh do {

if (!(server getvariable _trigID)) exitwith {_isActive=false;};

		if (_i >= _countHVehPool) 
			then {
		 if (_v >= _countHVehPool) then {_v=0;};
			 _tempVeh=_HvehList select _v;
			 _v=_v+1;
				};
		if (_i < _countHVehPool) 
			then {
			_tempVeh=_HvehList select _i;
				};

		if (_i >= _countPool) 
			then {
		 if (_n >= _countPool) then {_n=0;};
			 _UnitList=_infPool call BIS_fnc_arrayShuffle;
			 _tempUnit=_UnitList select _n;
			 _n=_n+1;
				};
		if (_i < _countPool) 
			then {
			_tempUnit=_UnitList select _i;
				};
				
		_roadInfo=_roadPosArray select _rdCount;		
		_tempPos=_roadInfo select 0;
		_direction=_roadInfo select 1;
		_rdCount=_rdCount+1;		
		
		_grp = createGroup _side;					
		_veh = createVehicle [_tempVeh, _tempPos, [], 0, "NONE"];
		_veh setdir _direction;
			0=[_veh,_tempUnit,_grp]call vehicleRoles;

				
				if (_HVgrpSize > 0) then {
					0=[_veh,_HVgrpSize,_grp,_UnitList] call fill_cargo;
									};					
	{
	null=[_x] execVM "addaction.sqf";
	_x setSkill ["aimingspeed", 0.1];
	_x setSkill ["spotdistance", 0.1];
	_x setSkill ["aimingaccuracy", 0.05];
	_x setSkill ["aimingshake", 0.05];
	_x setSkill ["spottime", 0.2];
	_x setSkill ["spotdistance", 0.4];
	_x setSkill ["commanding", 0.4];
	_x setSkill ["general", 0.3];
	}foreach units _grp;
	null=[_veh] execVM "addactionVeh.sqf";	
					
		_vehPack=[_veh,_grp];
		_vehPatrolArray set [count _vehPatrolArray,_grp];
		_HeavyArray set [count _HeavyArray,_vehPack];	
	};
null =[_infArray,_posArray] execVM "eos_L\inf_Patrol.sqf";
null =[_vehPatrolArray,_roadPosArray] execVM "eos_L\veh_Patrol.sqf";


IF (debugEOS_L) then {	
			_counter=0;
		{
	_grp=_x select 1;	
	_counter=_counter+1;
	_txt=format["VEH%1,EOS%2,%3",_counter,_mkr,_side];_debugMkr=createMarker [_txt,ASLtoATL getPosASL (leader _grp)];_debugMkr setMarkerShape "ICON";_debugMkr setMarkerType "hd_dot";_debugMkr setMarkercolor "colorRed";_debugMkr setmarkerAlpha 0.5;_debugMkr setMarkerText _txt;					
		}foreach _vehicleArray+_HeavyArray;	

_counter=0;
	{
_grp=_x;	
		{
	_counter=_counter+1;
	_txt=format["House%1,eos%2,%3",_counter,_mkr,_side];
	_debugMkr=createMarker [_txt,ASLtoATL getPosASL _x];_debugMkr setMarkerShape "ICON";_debugMkr setMarkerType "hd_dot";_debugMkr setMarkercolor "colorRed";_debugMkr setMarkerText _txt;_debugMkr setmarkerAlpha 0.5;
		}foreach units _grp;
	}foreach _hosArray;
_saveCounter=_counter;

_counter=0;
			{
		_grp=_x;
		_counter=_counter+1;
		_txt=format["INF%1,eos%2,%3",_counter,_mkr,_side];
		_debugMkr=createMarker [_txt,ASLtoATL getPosASL (leader _grp)];
		_debugMkr setMarkerShape "ICON";
		_debugMkr setMarkerType "hd_dot";
		_debugMkr setMarkercolor "colorRed";
		_debugMkr setmarkerAlpha 0.5;
		_debugMkr setMarkerText _txt;
		
			}foreach _infArray;	
				};
				
populating_EOS=false;

// Waituntil trigger is deactivated				
while {_isActive} do
		{
	_isActive=server getvariable _trigID;
		if (!_isActive) exitwith {};
		sleep 1;
		};

waituntil {!populating_EOS and !populating_COS};
	

populating_EOS=true;

if (debugEOS_L) 
	then {
	for "_i" from 1 to _saveCounter do {
	deletemarker (format["House%1,eos%2,%3",_i,_mkr,_side]);
				};
		};		
// Count remaining Units
 _counter=0;			
	{
	_grp=_x;
 _units={alive _x} count (units _grp);
 if (_units < round(_grpSize*0.2)) then {_infgroups=_infgroups-1;};
 _counter=_counter+1;
	if (debugEOS_L) then { deletemarker (format["inf%1,eos%2,%3",_counter,_mkr,_side]);};
		{deleteVehicle _x} forEach units _grp;
		deleteGroup _grp;
	}foreach _infArray;

 _counter=0;	
	{
_grp=_x;
 _units={alive _x} count (units _grp);
 if (_units < round(_HSEgrpSize*0.2)) then {_houseGrps=_houseGrps-1;};
  _counter=_counter+1;
	{deleteVehicle _x} forEach units _grp;
	deleteGroup _grp;
	}foreach _hosArray;		
		
	{
 if (!alive (_x select 0) OR ({alive _x} count crew (_x select 0) == 0)) then {_lightVeh=_lightVeh-1;};
	}foreach _vehicleArray;
	
	{
 if (!alive (_x select 0)OR ({alive _x} count crew (_x select 0) == 0)) then {_heavyVeh=_heavyVeh-1;};
	}foreach _HeavyArray;			
// Delete all vehicles and crew	
 _counter=0;
		{
	_veh=_x select 0;
	_grp=_x select 1;
	_counter=_counter+1;
		if (debugEOS_L) then {deletemarker (format["veh%1,eos%2,%3",_counter,_mkr,_side]);};

 
// CHECK VEHICLE IS NOT TAKEN BY PLAYER
	if ({isPlayer _veh} count (crew _veh) == 0) 
	 then {
	{deleteVehicle _x} forEach (crew _veh); deleteVehicle _veh;
		}; 
	{deleteVehicle _x} forEach units _grp;
	deletegroup _grp;
	
	}foreach _vehicleArray+_HeavyArray;
	
// If remembering then count groups and store in variable	
if (eos_Remember) then {
_cacheInfo=[_infgroups,_lightVeh,_heavyVeh,_houseGrps];
server setvariable [_cacheVar,_cacheInfo];

	if (debugEOS_L) then {player sidechat (format ["Cached:%4|%5,HSE:%6 ,INF:%1 ,Lveh:%2 ,Hveh:%3",_infgroups,_lightVeh,_heavyVeh,_mkr,_side,_houseGrps]);};
 };
populating_EOS=false;
};
};