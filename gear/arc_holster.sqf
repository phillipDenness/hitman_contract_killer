//
//	arc_holster.sqf
//	Sidearm-Holster-script by Arctorkovich
//  Modified for Hitman | Contract killer by BangaBob
//
// in init.sqf put:
// 
// if (!isDedicated) then
// {
//		holstered = 0;  
//		player addAction ["Holster sidearm","arc_holster.sqf",nil,2.5,false,true,"",""];
//  };

if (isDedicated) exitWith {};

private ["_unit","_holstered"];
_caller=_this select 1;
_id = _this select 2;
_args= _this select 3;
_holstered = (_args select 0);

IF (_holstered == 0) THEN {
		class_weapon = currentWeapon _caller;
				
		_caller removeAction _id;
				
		A_mags = [];
		_magazinesAmmoFull = magazinesAmmoFull _caller;
		
		for "_i" from 0 to ((count _magazinesAmmoFull)-1) do
		{
			_type = (_magazinesAmmoFull select _i) select 3;
			if(_type == 2) then 
			{
				A_mags = A_mags + [(_magazinesAmmoFull select _i) select 0];
			};			
		};
		
		A_mags = A_mags + [handgunMagazine _caller];
		b_count = _caller ammo class_weapon;
		I_items = handgunItems _caller;
		_caller removeWeapon class_weapon;
		_caller addAction ["Draw sidearm","gear\arc_holster.sqf",[1],2.5,false,true,"","(vehicle _this == _this)"];
	};
	
IF (_holstered == 1) THEN {
		_caller removeAction _id;
		
		for "_i" from 0 to ((count A_mags)-1) do
		{
			_caller addMagazine (A_mags select _i);
		};
				
		_caller addWeapon class_weapon;
		_caller setAmmo [handgunWeapon _caller, b_count];
		{_caller addHandgunItem _x}foreach I_items;
		_caller selectWeapon class_weapon;
		_caller addAction ["Holster sidearm","gear\arc_holster.sqf",[0],2.5,false,true,"","currentWeapon _this == handgunWeapon _this and (vehicle _this == _this)"];
	};
