_unit=(_this select 0);
_veh = createVehicle ["Box_East_Ammo_F", [(getPos _unit select 0)-1, getPos _unit select 1, getPos _unit select 2], [], 0, "can_collide"];

clearMagazineCargo _veh;
clearWeaponCargo _veh;	
removeallWeapons _unit;
{_unit removeMagazine _x} forEach magazines _unit;
{
_unit removeItems _x;
}foreach rewardItems;

_item=rewardItems select (floor(random(count rewardItems)));
_veh addItemCargo [_item, 1];


if (random 4 > 2) then {
// Add new weapon
_weapon=rewardWeapons select (floor(random(count rewardWeapons)));		
	_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
	_magazineClass = _magazines select 0;
		_veh addMagazineCargo [_magazineClass, 1];
		_veh addWeaponCargo [_weapon,1];
						}else{
						
// Add magazines for player						
_Weapon=class_weapon;			
	_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
	_magazineClass = _magazines select 0;
	_veh addMagazineCargo [_magazineClass, 2];
	};
						

waituntil {player distance _unit >200};
deletevehicle _unit;