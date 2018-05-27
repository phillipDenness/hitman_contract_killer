private ["_side"];
_unit = (_this select 0);
_side=civilian;
if (side _unit == West) then {_side=west;};
if (side _unit == east) then {_side=east;};
if (side _unit == independent) then {_side=independent;};

if (_unit != target) 
	then {
	_EHkilledIdx = _unit addEventHandler ["killed", {_this call innocentKilledFNC}];
		}; 
		
if (_unit == target) 
	then {
	_EHDamageIdx = _unit addEventHandler ["HandleDamage", {_this call injuryFNC}];	
	_EHkilledIdx = _unit addEventHandler ["killed", {_this execVM "taskComplete.sqf"}];
	_interrogate = _unit addAction ["Interrogate","actions\interrogate.sqf",[],6,false,true,"","_this distance _target < 4 && incapacitated && alive _target"];	
		};
						
 _EHfirednear = _unit addEventHandler ["FiredNear", {_this call shotAtPlayer_fnc;}];

_genAct = _unit addAction ["Ask Name","actions\askName.sqf",[],1,false,true,"","_this distance _target < 4 && alive _target && !incapacitated"];
_genActTwo = _unit addAction [(format["Take Clothes (Cost %1 score)",takeClothesCost]),"actions\takeClothes.sqf",[_side],2,false,true,"","_this distance _target < 4 && !alive _target"];