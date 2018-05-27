 _target=(_this select 0);
 _shooter=(_this select 1);
 
 _target removeAllEventHandlers "killed";
 _target removeAllEventHandlers "FiredNear";
 
 if (hideBattlefieldWeapons) then {
removeallWeapons _target;
{_target removeMagazine _x} forEach magazines _target;
	{
_target removeItems _x;
	}foreach rewardItems;
		};

