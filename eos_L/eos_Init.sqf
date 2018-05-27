if (isServer) then {
private ["_mSize","_actCond","_lightVehPool","_infPool","_heavyVehPool","_grpSize","_side","_HSEgrpSize","_HVgrpSize","_lVgrpSize","_minRoads","_hseGrps","_infgroups"];
_faction=(_this select 0);

// EAST CSAT FACTION
	if (_faction==0) then {	
	_InfPool=		["O_SoldierU_SL_F","O_soldierU_repair_F","O_soldierU_medic_F","O_sniper_F","O_Soldier_A_F","O_Soldier_AA_F","O_Soldier_AAA_F","O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AR_F","O_Soldier_AT_F","O_soldier_exp_F","O_Soldier_F","O_engineer_F","O_engineer_U_F","O_medic_F","O_recon_exp_F","O_recon_F","O_recon_JTAC_F","O_recon_LAT_F","O_recon_M_F","O_recon_medic_F","O_recon_TL_F"];	
	_heavyVehPool=	["O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_arty_F","O_MBT_02_cannon_F"];
	_lightVehPool=	["O_Truck_02_covered_F","O_Truck_02_transport_F","O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_Truck_02_medical_F"];
	_side=EAST;
};
// WEST NATO FACTION	
	if (_faction==1) then {
	_InfPool=		["B_sniper_F","B_Soldier_A_F","B_Soldier_AA_F","B_Soldier_AAA_F","B_Soldier_AAR_F","B_Soldier_AAT_F","B_Soldier_AR_F","B_Soldier_AT_F","B_soldier_exp_F","B_Soldier_F","B_engineer_F","B_medic_F","B_recon_exp_F","B_recon_F","B_recon_JTAC_F","B_recon_LAT_F","B_recon_M_F","B_recon_medic_F","B_recon_TL_F"];
	_heavyVehPool=	["B_MBT_01_cannon_F","B_MBT_01_arty_F","B_MBT_01_mlrs_F","B_MBT_01_TUSK_F","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F"];
	_lightVehPool=	["B_Truck_01_covered_F","B_Truck_01_transport_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Truck_01_medical_F"];
	_side=WEST;
};
// INDEPENDENT AAF FACTION	
	if (_faction==2) then {
	_InfPool=		["I_engineer_F","I_Soldier_A_F","I_Soldier_AA_F","I_Soldier_AAA_F","I_Soldier_AAR_F","I_Soldier_AAT_F","I_Soldier_AR_F","I_Soldier_AT_F","I_Soldier_exp_F","I_soldier_F","I_Soldier_GL_F","I_Soldier_repair_F"];	
	_heavyVehPool=	["I_APC_Wheeled_03_cannon_F"];
	_lightVehPool=	["I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_Truck_02_medical_F"];
	_side=RESISTANCE;
};
// WEST FIA FACTION
	if (_faction==3) then {
	_InfPool=		["B_G_engineer_F","B_G_medic_F","B_G_officer_F","B_G_Soldier_A_F","B_G_Soldier_AR_F","B_G_Soldier_exp_F","B_G_Soldier_F","B_G_Soldier_GL_F","B_G_Soldier_LAT_F","B_G_Soldier_lite_F","B_G_Soldier_M_F","B_G_Soldier_SL_F","B_G_Soldier_TL_F"];	
	_heavyVehPool=	[];
	_lightVehPool=	["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Van_01_transport_F","B_G_Van_01_fuel_F"];
	_side=WEST;
};
// ADD CLASSNAMES 
	if (_faction==4) then {
	_InfPool=		[];	
	_heavyVehPool=	[];
	_lightVehPool=	[];
	_side=;
};
// ADD CLASSNAMES 	
	if (_faction==5) then {
	_InfPool=		[];	
	_heavyVehPool=	[];
	_lightVehPool=	[];
	_side=;
};
// ADD CLASSNAMES 	
	if (_faction==7) then {
	_InfPool=		[];	
	_heavyVehPool=	[];
	_lightVehPool=	[];
	_side=;
};

_eos_distance=(_this select 1);
_markers=(_this select 2);

_groups=(_this select 4);
_infgroups=(_groups select 0);
_grpIncrement=(_groups select 1);

_houseGrps=(_this select 3);
_hseGrps=(_houseGrps select 0);
_hseIncrement=(_houseGrps select 1);

_vehArray=(_this select 5);
_lightVeh=(_vehArray select 0);
_vehCargo=(_vehArray select 1);

_HvehArray=(_this select 6);
_heavyVeh=(_HvehArray select 0);
_HvehCargo=(_HvehArray select 1);


if (_grpIncrement == 0) then {_grpSize=round (random 2)+1;};
if (_grpIncrement == 1) then {_grpSize=round (random 2)+3;};
if (_grpIncrement == 2) then {_grpSize=round (random 2)+5;};
if (_grpIncrement == 3) then {_grpSize=round (random 2)+7;};
if (_grpIncrement > 3) then {_grpSize=round (random 2)+9;};

if (_hseIncrement == 0) then {_HSEgrpSize=round (random 2)+1;};
if (_hseIncrement == 1) then {_HSEgrpSize=round (random 2)+3;};
if (_hseIncrement == 2) then {_HSEgrpSize=round (random 2)+5;};
if (_hseIncrement == 3) then {_HSEgrpSize=round (random 2)+7;};
if (_hseIncrement > 3) then {_HSEgrpSize=round (random 2)+9;};

if (_HvehCargo == 0) then {_HVgrpSize=round (random 2)+1;};
if (_HvehCargo == 1) then {_HVgrpSize=round (random 2)+3;};
if (_HvehCargo == 2) then {_HVgrpSize=round (random 2)+5;};
if (_HvehCargo == 3) then {_HVgrpSize=round (random 2)+7;};
if (_HvehCargo > 3) then {_HVgrpSize=round (random 2)+9;};

if (_vehCargo == 0) then {_lVgrpSize=round (random 2)+1;};
if (_vehCargo == 1) then {_lVgrpSize=round (random 2)+3;};
if (_vehCargo == 2) then {_lVgrpSize=round (random 2)+5;};
if (_vehCargo == 3) then {_lVgrpSize=round (random 2)+7;};
if (_vehCargo > 3) then {_lVgrpSize=round (random 2)+9;};

_rad=25;
_slack=5;

 {
	_mkr=_x;
	_pos=(markerpos _x);
	_sizeX=getMarkerSize _x select 0;
	_sizeY=getMarkerSize _x select 1;
	if (_sizeY>_sizeX) then {_mSize=_sizeY}else{_mSize=_sizeX};// Get the largest size

// Show or hide marker
	_mkr setMarkerColor "ColorRed";
	if (!eos_L_showMarker) then {_mkr setmarkerAlpha 0;}else{_mkr setmarkerAlpha 0.5;};// Show or hide marker


_houseList= nearestObjects [_pos, ["house"], _mSize];	
_houses= count _houseList;
_buildings=[];
_housePos=[];
_houseInfPos=(_HSEgrpSize*_hseGrps);

if (_houses > _houseInfPos) then {
_houseList=_houseList call BIS_fnc_arrayShuffle;	

for "_n" from 1 to _houseInfPos do {
	_house=_houseList select _n;
	_buildings set [count _buildings,_house];
		};
	

  {
 private ["_i","_p"];//SHK_buildingPos extract
    for [{_i = 0;_p = _x buildingpos _i},{str _p != "[0,0,0]"},{_i = _i + 1;_p = _x buildingpos _i}] do {
      _housePos set [count _housePos,_p];
    };
  } foreach _buildings;
		}else{
	_infgroups=_infgroups+_hseGrps;
	_hseGrps=0;
 };

		
	_roadPosArray = [];
	_minVehPos=(_heavyVeh+_lightVeh+_slack);

if ((_heavyVeh+_lightVeh) > 0) 
	then {
 _roadlist = _pos nearRoads (_mSize+_rad);
 _roadlist=_roadlist call BIS_fnc_arrayShuffle;
 _roads=count _roadlist;
	if (_roads < _minVehPos) 
		then {
	_minRoads=_roads;
	
 for "_n" from 1 to _minRoads do
		{
	_currentRoad=_roadlist select _n;
	 _roadConnectedTo = roadsConnectedTo _currentRoad;
	_connectedRoad = _roadConnectedTo select 0;
	_direction = [_currentRoad, _connectedRoad] call BIS_fnc_DirTo;
	_roadInfo=[_currentRoad,_direction];
     _roadPosArray set [count _roadPosArray, _roadInfo];
		};	

 _minVehPos=_minVehPos-_minRoads;
	
 for "_n" from 1 to _minVehPos do
		{
	_tempPos= [_mkr] call shk_pos;
	_roadInfo=[_tempPos,round(random 359)];
    _roadPosArray set [count _roadPosArray, _roadInfo];
		};
		
	}else{
	
 for "_n" from 1 to _minVehPos do
		{
	_currentRoad=_roadlist select _n;
	 _roadConnectedTo = roadsConnectedTo _currentRoad;
	_connectedRoad = _roadConnectedTo select 0;
	_direction = [_currentRoad, _connectedRoad] call BIS_fnc_DirTo;
	_roadInfo=[_currentRoad,_direction];
     _roadPosArray set [count _roadPosArray, _roadInfo];
		};
	};
};

 _posArray=[];
 
_minPositions=(_infgroups+_hseGrps+_slack);

if (_minPositions > 0) 
	then {
 for "_n" from 0 to _minPositions do
		{
	 _tempPos= [_mkr] call SHK_pos;
	_posArray set [_n, _tempPos];
		};	
};	

_UnitList=_infPool call BIS_fnc_arrayShuffle;
_posArray=_posArray call BIS_fnc_arrayShuffle;
_roadPosArray=_roadPosArray call BIS_fnc_arrayShuffle;
_vehList=_lightVehPool call BIS_fnc_arrayShuffle;
_HvehList=_heavyVehPool call BIS_fnc_arrayShuffle;
_housePos=_housePos call BIS_fnc_arrayShuffle;

// Save all information
_zoneVar=format["zInfo%1%2",_mkr,_faction];
_zoneInfo=[_vehList,_UnitList,_HvehList,_grpSize,_lVgrpSize,_HVgrpSize,_posArray,_HSEgrpSize,_housePos,_roadPosArray,_side];
server setvariable [_zoneVar,_zoneInfo];

	_cacheInfo=[_infgroups,_lightVeh,_heavyVeh,_hseGrps];
	_cacheVar=format["Cache%1%2",_mkr,_faction];
	server setvariable [_cacheVar,_cacheInfo];	
	_var= format ["eosClear%1",_mkr];
	server setvariable [_var,false];
	
// Create a trigger over town	
		_trigger = createTrigger ["EmptyDetector",_pos]; 
		_trigger setTriggerArea [(_eos_distance+_sizeX),(_eos_distance+_sizeY),(markerDir _x),FALSE]; 
		_trigger setTriggerActivation ["ANY","PRESENT",true];
		_trigger setTriggerTimeout [1, 1, 1, true];
			if eos_L_ArielActivation // Set whether units above 50m high will trigger
					then {
				_actCond="{vehicle _x in thisList && isplayer _x} count allunits > 0";
						}else{
					_actCond="{vehicle _x in thisList && isplayer _x && ((getPosATL _x) select 2) < 50} count allunits > 0";
						};
		_var=format["trig%1%2", _mkr,_faction];
		_trigAct=format ["null= [%1,%3] execVM ""eos_L\eos_L_core.sqf"";server setvariable [%2,true];",str _mkr,str _var,_faction];
		_trigDe=format ["server setvariable [%1,false];",str _var];
		_trigger setTriggerStatements [_actCond,_trigAct,_trigDe];
 }foreach _markers;
};