_veh=(_this select 0);

_veh addAction [(format ["Repair Vehicle (Cost %1 score)",repairCost]),"actions\repairVeh.sqf",[],6,false,true,"","_this distance _target < 4 && ((getDammage _target)>0) && vehicle _this != _target"];