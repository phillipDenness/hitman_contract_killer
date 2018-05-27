_unit=(_this select 0);
_selectionName=(_this select 1);
_dammage=(_this select 2);

if (_dammage > 0.2 and (_selectionName == "legs")) then {
 incapacitated=true;
	_unit switchmove "Acts_SittingWounded_breath";
	_unit disableAI "AUTOTARGET";
	_unit disableAI "TARGET";
	_unit disableAI "MOVE";
	_unit setVariable ["BIS_noCoreConversations", true];
	
	{_unit removeMagazine _x} forEach magazines _unit;
	removeallweapons _unit;
	removebackpack _unit;
	_unit removeAllEventHandlers "HandleDamage";
		};
