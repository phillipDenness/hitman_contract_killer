 _target=target;
 incapacitated=false;
 ContractOffered=false;
 reward=5;
 null = [_target] execVM "addaction.sqf";
 
	_target setSkill ["aimingspeed", 0.1];
	_target setSkill ["spotdistance", 0.1];
	_target setSkill ["aimingaccuracy", 0.1];
	_target setSkill ["aimingshake", 0.05];
	_target setSkill ["spottime", 0.3];
	_target setSkill ["spotdistance", 0.4];	
	
 if (count _this > 0) then {
	_roadlist=(_this select 0);
 null =[group _target,_roadlist] execVM "simplePatrol.sqf";
							}else{
		null =[group _target] execVM "simplePatrol.sqf";
							};
 
 _taskPool = ["A client is requesting our assistance regarding %1. I am forwarding you their ID now. Take care of it.","Our client wants %1 dead. We have sent you the targets information. You know what to do.","%1 is wanted dead. We have emailed you his details."];
 _tempTask=_taskPool select (floor(random(count _taskPool)));
 _text=format [_tempTask,name target];
 
 CurrentTaskID = format ["Contract #%1",round (random 300)];
 [CurrentTaskID,CurrentTaskID,_text] call SHK_Taskmaster_add;
 
 sleep 1;
	null = [] execVM "targetInfo.sqf";
	null = [] execVM "assassin_stats.sqf";
	null = [_target] execVM "aiAwareness.sqf";
	hint "";
	
