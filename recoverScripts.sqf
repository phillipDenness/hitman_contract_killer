
if (ContractOffered) then {
null=[]execVM "selectTarget.sqf";
		}else{
CurrentTaskID call SHK_Taskmaster_setCurrentLocal;
null = [] execVM "targetInfo.sqf";
null = [] execVM "assassin_stats.sqf";};
		(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
		_handle=(findDisplay 46) displaySetEventHandler ["KeyDown","_this call spawnKeys"];