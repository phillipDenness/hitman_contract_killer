disableSerialization;
puppet addWeapon (secondaryWeapons select 0);

	
	(finddisplay 46) displayRemoveAllEventHandlers "KeyDown";
	_handle=(findDisplay 46) displaySetEventHandler ["KeyDown","_this call selectGear"];

	removeAllWeapons player;
	clearMagazineCargo player;
	removeHeadgear puppet;
	removeHeadgear player;
		player addBackpack "B_Bergen_sgg";
		puppet addBackpack "B_Bergen_sgg";
		puppet disableai "move";
		puppet adduniform (uniforms select 0);

		startingVehicle setposATL [(getposATL puppet select 0)+3,(getposATL puppet select 1)+2,(getposATL puppet select 2)];
		startingVehicle setdir 230;
			cam = "camera" camcreate [(getposATL puppet select 0)-3,(getposATL puppet select 1),(getposATL puppet select 2)+1.6];
			_direction = [cam, puppet] call BIS_fnc_DirTo;
			cam setDir  _direction;
			cam camSetFov 0.7;
			cam camcommit 0;
			cam cameraEffect ["internal", "BACK"];
			showCinemaBorder false;	
selection=0;
selectionGun=0;

2 cutRsc ["gearDisplay", "PLAIN"];

waitUntil {!isNull (uiNameSpace getVariable "gearDisplay")};
_display = uiNameSpace getVariable "gearDisplay";

(_display displayCtrl 902) ctrlSetStructuredText
(parseText 
"<t align='Center' color='#FFFFFF' shadow='0' >Press W and S keys to select weapon</t><br/><br/>
<t align='Center' color='#FFFFFF' shadow='0' >Press A and D keys to select uniform</t><br/><br/>
<t align='Center' color='#FFFFFF' shadow='0' >Press ENTER to begin</t><br/>" 
);

private ["_angle"];
 _angle=getdir puppet;
	while {!gearFinish} 
		do {
 _angle=_angle+1;
 puppet setdir _angle;
 sleep 0.01;
		};
 player addUniform (uniform puppet); 	
 _Weapon=(handgunWeapon puppet);
 deletevehicle puppet;
 	_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
		_magazineClass = _magazines select 0;
 		{player removeMagazine _x} forEach magazines player;
			for "_i" from 1 to 4 do
			 {player addMagazine _magazineClass;};
2 cutRsc ["Default", "PLAIN"];
	player addweapon _Weapon;	
	player additem "FirstAidKit";
	player additem "FirstAidKit";
	
class_weapon = currentWeapon player;
							
	A_mags = [];
	_magazinesAmmoFull = magazinesAmmoFull player;

		for "_i" from 0 to ((count _magazinesAmmoFull)-1) do
		{
			_type = (_magazinesAmmoFull select _i) select 3;
			if(_type == 2) then 
			{
				A_mags = A_mags + [(_magazinesAmmoFull select _i) select 0];
			};			
		};
		
		A_mags = A_mags + [handgunMagazine player];
		b_count = player ammo class_weapon;
		I_items = handgunItems _caller;
		player removeWeapon class_weapon;
		player addAction ["Draw sidearm","gear\arc_holster.sqf",[1],2.5,false,true,"","(vehicle _this == _this)"];