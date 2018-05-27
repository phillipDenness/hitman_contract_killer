private ["_target","_caller"];
_target = _this select 0;
_caller = _this select 1;
_id = _this select 2; 

_conversationPool = ["Welcome to the neighbourhood, I'm %1","Damn foreigner...","Ello mate, I'm %1","psss, Eyes down, keep walking, just keep walking. Don't make any eye contact.","%1, Who are you?","Keep walking dude.","Cant you see that I am busy!","...huh","Hi, My name is %1.","Fuck off mate.","Mind your own business","Greetings stranger, I'm %1.","Erm, do I know you?","You're not from around here are you..."];
_spottedPool=["You're on the wrong side!","You will never take me alive!","You're a blackShark hitman","You messed with the wrong guy"];
_scaredPool = ["You going to shoot me with that?","All you people bring is death","Please don't kill me!","I see your gun...","I don't talk to mercs","Put the gun away"];


_direction = [_target, _caller] call BIS_fnc_DirTo;
_target setdir _direction;
_target domove position _caller;
_target disableAI "Move";

 if (_target == target) 
	then {
	if (random 6 > 2 or (currentWeapon _caller != "" and vehicle _caller == _caller)) then {
		0= [_target,_caller] call shotAtPlayer_fnc;
		
			_tempSpotted=_spottedPool select (floor(random(count _spottedPool)));
				titleText [_tempSpotted, "PLAIN DOWN"];
				titleFadeOut 6;
					}else{
						_tempConvo=_conversationPool select (floor(random(count _conversationPool)));
							 _text = format [_tempConvo,Name _target];
							titleText [_text, "PLAIN DOWN"];
								titleFadeOut 6;
							 };
		}else{
if (currentWeapon _caller == "") then {
_tempConvo=_conversationPool select (floor(random(count _conversationPool)));
 _text = format [_tempConvo,Name _target];
							titleText [_text, "PLAIN DOWN"];
								titleFadeOut 6;
								}else{
								_tempConvo=_scaredPool select (floor(random(count _scaredPool)));
								 _text = format [_tempConvo,Name _target];
								titleText [_text, "PLAIN DOWN"];
								
								};
	};
	sleep 1;
_target enableAI "Move";