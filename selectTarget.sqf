_targetPool=[["TargetOPFOR.sqf","Warzone - CSAT Target"],["TargetBLU.sqf","Warzone - NATO Target"],["TargetCIV.sqf","Civilian Target"]];
_tempArray=_targetPool select (floor(random(count _targetPool)));
_tempTarget=(_tempArray select 0);
_tempText2=(_tempArray select 1);
		player removeAction ACTIONID2;
		player removeAction ACTIONID1;
hint "Incoming Phone call";

	ContractOffered=true;
	_tempText =format ["<t color='#10FE4B'>Accept Contract : %1 </t>",_tempText2];
	deletevehicle Phone;
	Phone = createVehicle ["Land_HelipadEmpty_F", position player, [], 0, "CAN_COLLIDE"];
	Phone attachTo [player,[0,0,1]];  
	Phone say2D "PHONECALL";

ACTIONID1=player addAction [_tempText,{
	_caller=(_this select 1);
	_args=(_this select 3);
	_temptarget=(_args select 0);
	deletevehicle Phone;
		_caller removeAction ACTIONID2;
		_caller removeAction ACTIONID1;
		hint "";
	null = [] execVM _tempTarget;
			},[_tempTarget],6,false,true,"","ContractOffered"];
			
_tempText =format ["<t color='#FC6B61'>Decline Contract : %1 </t>",_tempText2];			
ACTIONID2=player addAction [_tempText,{	
	_caller=(_this select 1);
	_args=(_this select 3);

		_caller removeAction ACTIONID2;
		_caller removeAction ACTIONID1;
		deletevehicle Phone;
		hint "";
		sleep (random 10);
			
		null = [] execVM "selectTarget.sqf";
	},[],6,false,true,"","ContractOffered"];	
