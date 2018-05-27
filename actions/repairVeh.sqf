_target = _this select 0;
_caller = _this select 1;
_id = _this select 2; 

 if (cash >= repairCost) 
	then {
	cash=cash-repairCost;
	_target setPos [ getPos _target select 0, (getPos _target select 1) +0, (getPos _target select 2)+1.5];
_target setdamage 0;

hint "Vehicle repaired";
	}else{
	hint "Not enough Score";
	};