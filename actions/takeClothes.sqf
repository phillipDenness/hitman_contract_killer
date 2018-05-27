_target = _this select 0;
_caller = _this select 1;
_id = _this select 2; 

_args = (_this select 3);
_side = (_args select 0);
if (!spotted) then {
 if (cash >= takeClothesCost) 
	then {
	cash=cash-takeClothesCost;
	
_oldGrp=group _caller;
	[_caller] joinSilent createGroup _side;
deleteGroup _oldGrp;	
 _target removeaction _id;
 _target enablesimulation false;	
 _newUniform=uniform _target;
 _uniform=uniform _caller;

_items=uniformItems _caller;
_magazines=uniformMagazines _caller;


if (_newUniform != _uniform) 
	then {
	null=[_caller,false] execVM "setWanted.sqf";
				};

_caller addUniform _newUniform;
removeUniform _target;

	{
_caller addItemToUniform _X;
	}foreach _items;
	
	{
_caller addMagazine _x;
	}foreach _magazines;
		
}else{
hint "Not enough score";
};}else{
hint "You are spotted. Wait for 30 seconds.";
};