if (!hitsquad) then {
private ["_pos","_needDriver","_DRIVER","_side","_callingHitmen"];
 _uniformPool=["U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2"];
 _vestPool=["V_TacVest_blk_POLICE","V_TacVestIR_blk","V_BandollierB_rgr"];
 _weaponPool = ["arifle_Katiba_ACO_F","arifle_Mk20_ACO_F","arifle_MX_ACO_F","arifle_MXC_ACO_F","arifle_TRG20_ACO_F","SMG_01_ACO_F","srifle_DMR_01_ACO_F"];

 _roadlist = getpos player nearRoads 500;
 _number=(count _roadlist) -1;
 _spawnPos=_roadlist select _number;
 _debug=false;

 hitsquad=true;
	if (music) then {
		_tempmusic=hitsquadMSC select (floor(random(count hitsquadMSC)));
		playMusic [_tempmusic,0];
				0 fadeMusic 0;
				3 fadeMusic 1;
					};
	if (_debug) then {
deletemarker "hitquadMkr";
		hitquadMkr=createMarker ["hitquadMkr",_spawnPos];
		hitquadMkr setMarkerShape "ICON";
		hitquadMkr setMarkerType "hd_dot";
		hitquadMkr setMarkercolor "colorRed";
		hitquadMkr setmarkerAlpha 0.5;
		hitquadMkr setMarkerText "hitquadMkr";
			};
			
_grp= creategroup EAST;
_driverGrp = creategroup EAST;
_veh = createVehicle ["B_G_Offroad_01_armed_F", _spawnPos, [], 0, "NONE"];					
	_roadConnectedTo = roadsConnectedTo _spawnPos;
	_connectedRoad = _roadConnectedTo select 0;
	_direction = [_spawnPos, _connectedRoad] call BIS_fnc_DirTo;
		_veh setdir _direction;
		_positions = _veh emptyPositions "cargo";
			
_needDriver=true;			
for "_i" from 1 to (_positions) do {		 
	
		if (_needDriver) then {
			_needDriver=false;
			_DRIVER = _driverGrp createUnit ["O_Soldier_F", getpos _veh, [], 0, "NONE"];
				_DRIVER assignasdriver _veh;
				_DRIVER moveindriver _veh;
					}else{
				  _unit = _grp createUnit ["O_Soldier_F", getpos _veh, [], 0, "NONE"];
				  _unit assignAsCargo _veh; 
				  _unit moveInCargo _veh;
					};
				};			

{
_tempUniform=_uniformPool select (floor(random(count _uniformPool)));
_tempVest=_vestPool select (floor(random(count _vestPool)));
_weapon=_weaponPool select (floor(random(count _weaponPool)));
_unit=_x;

removeHeadgear _unit:
removeGoggles _unit;
removeVest _unit;
removeBackpack _unit;
removeUniform _unit;
removeAllWeapons _unit:
removeAllAssignedItems _unit;

			_unit addweapon _weapon;
			_unit addUniform _tempUniform;
			_unit addvest _tempVest;

				  
 _magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
		_magazineClass = _magazines select 0;
 		{_unit removeMagazine _x} forEach magazines _unit;
			for "_i" from 1 to 10 do
			 {_unit addMagazine _magazineClass;};
		_unit setrank "CORPORAL";
	_unit setSkill ["aimingspeed", 0.1];
	_unit setSkill ["spotdistance", 0.1];
	_unit setSkill ["aimingaccuracy", 0.1];
	_unit setSkill ["aimingshake", 0.05];
	_unit setSkill ["spottime", 0.3];
	_unit setSkill ["spotdistance", 0.4];
	
	null = [_unit] execVM "addaction.sqf";
	_EHkilledIdx = _unit addEventHandler ["killed", {_this call hitManKilledFNC}]; 	
	
}foreach units _grp + units _driverGrp;

_driverGrp setBehaviour "COMBAT";
_driverGrp setSpeedMode "Normal";
_pos =  [(getpos player select 0)-50*sin(random 359),(getPos player select 1)-50*cos(random 359)];
    _wp = _driverGrp addWaypoint [_pos, 0,1];
    _wp setWaypointType "MOVE";
	
	_oldGrp=group player;
	[player] joinSilent createGroup INDEPENDENT;
	_side=side player;	
	deleteGroup _oldGrp;


_callingHitmen=false;
while {{alive _x} count units _grp > 0} do {

if (_pos distance player > 50) then {_pos =  [(getpos player select 0)-100*sin(random 359),(getPos player select 1)-100*cos(random 359)];};
_leader=leader _grp;
_side=side player;

if (str _side == "EAST") exitwith {};

if (vehicle _leader != _leader) then {

	if (_veh distance _pos < 60) then {
	if (_debug) then{	hint "within area. Unloading";};
	
		dostop _driver;
		_veh setfuel 0;
		_grp leaveVehicle _veh;	
		waituntil {{alive _x} count (crew _veh) <= 1};	
				_pos =  [(getpos player select 0)-20*sin(random 359),(getPos player select 1)-20*cos(random 359)];
				
				}else{
		if (_debug) then{	hint "Approaching area";};
		_veh setdamage 0;
		_veh setfuel 1;
			_wp = _driverGrp addWaypoint [_pos, 0,1];
			_driverGrp setCurrentWaypoint [_driverGrp, 1];
			[_driverGrp, 1] setWPPos _pos;
				};
			};
				
				
 if (vehicle _leader == _leader) 
	then {
		if (_leader distance _pos > 150) 
					then {				
	if (_debug) then{hint "Returning to vehicle";};
		IF (!ALIVE _Driver) then {_needDriver=true;};
				{
		if (_needDriver) then {
				_needDriver=false;
				_x assignasdriver _veh;
				_x moveindriver _veh;
					}else{
			_x assignAsCargo _veh;
			_x moveInCargo _veh;
			};	
				}foreach units _grp;
				
						}else{
			if (_debug) then{hint "Unloaded. Approaching target";};	
				_wp = _grp addWaypoint [_pos, 0,0];
				_grp setCurrentWaypoint [_grp, 0];
				[_grp, 0] setWaypointType "SAD";
							};
			};
if (_leader distance player > 750) 
	exitwith {
 if (random 4 > 2) exitwith {
	_callingHitmen=true;
	if (_debug) then{hint "Calling more hitmen";};	
	null=[] execVM "hitsquad.sqf";
					};
	};
sleep 5;
};
hitsquad=false;
	if (music and !_callingHitmen) then {
		_tempmusic=ThemeMSC select (floor(random(count ThemeMSC)));
			5 fadeMusic 0;
			playMusic _tempmusic;
			0 fadeMusic 0;
			3 fadeMusic 1;
									};
	if ({isPlayer _veh} count (crew _veh) == 0) 
	 then {
	{deleteVehicle _x} forEach (crew _veh); 
		deleteVehicle _veh;
		}; 
{ deleteVehicle _x } forEach units _grp + units _driverGrp;
	deletegroup _grp;
	deletegroup _driverGrp;
	
if (STR _side == "GUER" OR STR _side == "ENEMY") 
	then {
	_oldGrp=group player;
	[player] joinSilent createGroup CIVILIAN;
	deleteGroup _oldGrp;
		};
}else{};