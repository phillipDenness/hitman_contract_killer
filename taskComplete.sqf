disableSerialization;
 _display = uiNameSpace getVariable "hudDisplay";
 _target=(_this select 0);
 deletegroup (group _target);
 IF (hideBattlefieldWeapons) THEN {
				removeAllweapons _target;
							};
 _target removeAllEventHandlers "killed";
 _target switchmove "";

	[CurrentTaskID,"succeeded"] call SHK_Taskmaster_upd;
	(_display displayCtrl 1980) ctrlShow true;
	playSound ["terminatedSFX",true];
	cash=cash+reward;;
	null=[_target] execVM "rewardBody.sqf";
		sleep 4;
		
if (random 10 < mercenariesChance) then {null=[]execVM "hitsquad.sqf";};
			cutRsc ["Default", "PLAIN"];
				deletevehicle pictureMan;
				deletemarker "TargetMarker";			
					null= [] execVM "selectTarget.sqf";
				