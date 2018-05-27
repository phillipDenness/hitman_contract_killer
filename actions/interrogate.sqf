_target=(_this select 0);
_caller=(_this select 1);

_caller switchmove "HubBriefing_scratch";
sleep 3;
_caller switchmove "AinvPercMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";

_damage=damage _target;
_n=random 0.8;
if (_damage < (_n+0.1)) then {
titleText ["Give some encouragement", "PLAIN DOWN",6];
		}else{
	titleText ["Information gained. Finish him", "PLAIN DOWN",6];
	reward=reward+5;	
		};