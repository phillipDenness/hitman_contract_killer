private ["_n","_town_name"];
disableSerialization;
ID_Active=true;
_bioPool = ["Wanted for breaking into the Altis life bank vault.","A Navy serviceman that raided 3 oil tankers in the Pacific ocean.","'Mad man Mikhalis' runs guns from North Africa to the Republic of Altis on a high-powered speedboat.","'Nice guy Nikos' is actually a human trafficer who promises refugees from north Africa to take them to southern Europe"];
_tempBio=_bioPool select (floor(random(count _bioPool)));

	cam = "camera" camcreate [0,0,0];
	cam attachTo [pictureman, [0,3,0.5],"Pelvis"];
	cam camSetTarget pictureman;
	cam camSetFov 0.1;
	cam camcommit 0;
		showCinemaBorder false;	
			cutRsc ["hudDisplay", "PLAIN"]; //show

waitUntil {!isNull (uiNameSpace getVariable "hudDisplay")};
_display = uiNameSpace getVariable "hudDisplay";
(_display displayCtrl 1200) ctrlSetText "#(argb,256,256,1)r2t(rendertarget2,1.0)";	


cam cameraEffect ["INTERNAL", "BACK","rendertarget2"];
"rendertarget2" setPiPEffect [0];

_closesttown = (nearestLocations [target,["NameCityCapital","NameCity","NameVillage"],10000]) select 0;

if (TargetType == "CIVZONE") then {_town_name = text _closesttown;};
if (TargetType == "WARZONEOPF") then {_town_name = "WARZONE - CSAT";};
if (TargetType == "WARZONEBLU") then {_town_name = "WARZONE - NATO";};

// Elimination text
(_display displayCtrl 1980) ctrlSetStructuredText 
(parseText format [
"<t align='Center' valign='TOP' color='#FD270A' shadow='1' shadowColor='#000000' size='6' font='PuristaBold'>%1 ELIMINATED</t><br/><br/>", 
name target]);

// Hide elimination text
(_display displayCtrl 1980) ctrlShow false;
_n=0;
 while {alive target} do {
	_gridPos = mapGridPosition getPos target;
		(_display displayCtrl 1000001) ctrlSetStructuredText 
			(parseText format [
				"<t align='Left' color='#D5E000' shadow='0' >Name: %1</t><br/>
				<t align='Left' color='#D5E000' shadow='0' >Location: %2</t><br/>
				<t align='Left' color='#D5E000' shadow='0' >Rank: %3</t><br/>
				<t align='Left' color='#D5E000' shadow='0' >Grid Ref: %4</t><br/><br/>
				<t align='Left' color='#FFFFFF' shadow='0' size='1.5'>Bio: %5</t><br/>",
						name target,_town_name,Rank target,_gridPos,_tempBio]);								
if (firedNear >= 2) 
	then {
	null=[player,true] execVM "setWanted.sqf";
	spotted=true;
	_n=6;
		};
_n=_n-1;
if (_n < 0) then {spotted=false;};
firedNear=0;	
 sleep 5;
};