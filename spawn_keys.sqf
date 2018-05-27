private ["_display","_displayTarget"];
disableSerialization;
_display = uiNameSpace getVariable "statDisplay";
_displayTarget = uiNameSpace getVariable "hudDisplay";
_keys=(_this select 1);
	if (_keys == 210) 
			then {
			if (ID_Active) then {
				ID_Active = false;
			(_displayTarget displayCtrl 1999) ctrlShow false;
			(_displayTarget displayCtrl 1200) ctrlShow false;
			(_displayTarget displayCtrl 1000001) ctrlShow false;
					} else {
					ID_Active = true;
					(_displayTarget displayCtrl 1999) ctrlShow true;
					(_displayTarget displayCtrl 1200) ctrlShow true;
					(_displayTarget displayCtrl 1000001) ctrlShow true;
						};
				
					};
	if (_keys == 211) 
			then {
			null =[] execVM "markTarget.sqf";
					};
					
					
	if (_keys == 207) 
			then {
			if (STAT_Active) then {
			STAT_Active=false;
			(_display displayCtrl 1203) ctrlShow false;
			(_display displayCtrl 1201) ctrlShow false;
			(_display displayCtrl 1000002) ctrlShow false;
			}else{
			STAT_Active=true;
			(_display displayCtrl 1203) ctrlShow true;
			(_display displayCtrl 1201) ctrlShow true;
			(_display displayCtrl 1000002) ctrlShow true;
			};
					};