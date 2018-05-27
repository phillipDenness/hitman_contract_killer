_target=(_this select 0);
_killer=(_this select 1);

if (_killer == player) then {
player addrating 1000;

};

 _target removeAllEventHandlers "killed";