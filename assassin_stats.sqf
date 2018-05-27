private ["_display","_side"];
disableSerialization;
STAT_Active=true;

2 cutRsc ["statDisplay", "PLAIN"]; //show

waitUntil {!isNull (uiNameSpace getVariable "statDisplay")};
_display = uiNameSpace getVariable "statDisplay";

// Elimination text
(_display displayCtrl 1204) ctrlSetStructuredText 
(parseText
"<t align='Center' valign='TOP' color='#FD270A' shadow='1' shadowColor='#000000' size='3' font='PuristaBold'>Hit-squad<br/>approaching</t><br/><br/>");

(_display displayCtrl 1205) ctrlSetStructuredText 
(parseText
"<t align='Center' valign='TOP' color='#FC381B' shadow='1' shadowColor='#000000' size='3' font='PuristaBold'>WANTED</t><br/><br/>");

// Hide elimination text
(_display displayCtrl 1204) ctrlShow false;
// Hide elimination text
(_display displayCtrl 1205) ctrlShow false;

while {alive player} do {
_gridPos = mapGridPosition getPos player;
_side=side player;

	if (str _side == "GUER") then {_side="Target";};
		(_display displayCtrl 1000002) ctrlSetStructuredText
		(parseText format [
		"<t align='Left' color='#FFFFFF' shadow='0' >%1</t><br/>
		<t align='Left' color='#FFFFFF' shadow='0' >%2</t><br/>
		<t align='Left' color='#FFFFFF' shadow='0' >%3</t><br/>
		<t align='Left' color='#FFFFFF' shadow='0' >%4</t><br/><br/>", 
			name player,_side,cash,_gridPos]);

if (WANTED) then {(_display displayCtrl 1205) ctrlShow true;
if (tooltipWanted) then {
	tooltipWanted=false;	
 "Wanted Information" hintC [
	"Your cover is blown. NATO, CSAT and Civilians know who you are",
	"To lose the your wanted level steal a NATO, CSAT OR civilian uniform",
	"To lose the your wanted level stealthily kill your next target"
];	};
}else{(_display displayCtrl 1205) ctrlShow false;};

if (hitsquad) then {
(_display displayCtrl 1204) ctrlShow true;
	if (tooltipHitsquad) then {
	tooltipHitsquad=false;	
 "Hit-squad Information" hintC [
	"A price is on your head! Mercenaries have found you.",
	"To lose the mercenaries you can either:",
	"Murder them all.",
	"Steal a CSAT uniform",
	"CSAT (East) are working with the mercenaries.",
	"NATO (West) will assist in killing the mercenaries."
];	};


}else{(_display displayCtrl 1204) ctrlShow false;};
"vehMkr" setmarkerpos getpos startingVehicle;
sleep 1;
};