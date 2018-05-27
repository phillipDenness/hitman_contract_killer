_caller=(_this select 0);
_addWanted=(_this select 1);

	if (_addWanted) then {
	WANTED=true;
		_rating = rating _caller;
				_difference = -2000 - _rating;
				_caller addrating (_difference-2000);
					if (music) then {
					_tempmusic=wantedMSC select (floor(random(count wantedMSC)));
				5 fadeMusic 0;
				playMusic [_tempmusic,0];
				0 fadeMusic 0;
				3 fadeMusic 1;
							};
					}else{
					WANTED=false;
					_rating = rating _caller;
					_difference = 0 - _rating;
					_caller addrating _difference;
					if (music) then {
					_tempmusic=ThemeMSC select (floor(random(count ThemeMSC)));
						5 fadeMusic 0;
						playMusic _tempmusic;
						0 fadeMusic 0;
						3 fadeMusic 1;
									};
					};