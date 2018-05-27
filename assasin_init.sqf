titleText ["", "BLACK IN", 1];
0 fadeSound 1;

music=true;
RANGE=6000;
cash=5;
repairCost = 2;
takeClothesCost=5;
showHints=true;
mercenariesChance=3;
hideBattlefieldWeapons=true;

wantedMSC=["wantedOne","wantedTwo"];
ThemeMSC=["themeOne","themeTwo"];
hitsquadMSC=["wantedOne","wantedTwo"];

IF (music) THEN {
_tempmusic=ThemeMSC select (floor(random(count ThemeMSC)));
	playMusic [_tempmusic,0];
		0 fadeMusic 0;
		3 fadeMusic 1;
				};
				
(format ["Welcome %1 | Please Read v0.4!",name player]) hintC [
	"You have arrived in Altis, a country ravaged by war and poverty. This gives us the opportunity to conduct business without much resistance.",
	"Alerting the target to your presence will make you 'wanted' by all factions",
	"Change clothes to lose your wanted level",
	"You are not 'wanted' by the NATO and CSAT forces yet. To maintain this advantage you must avoid killing innocent people.",
	"To identify your targets you must either have a visual confirmation (Using the information available), or try asking for their name.",
	"Press 'INSERT' to show/hide objective information.",
	"Press 'END' to show/hide your personal stats.",
	"Make sure you have PIP enabled in your video settings",
	"Press 'DEL' to reveal your target on the map. (Debugging purposes only!)"
];

ID_Active=false;
STAT_Active=false;
hitsquad=false;
WANTED=FALSE;
spotted=false;
firedNear=0;

	if (showHints) then {
		tooltipHitsquad=true;
		tooltipWanted=true;
			}else{
		 tooltipHitsquad=false;
		 tooltipWanted=false;
		 };
		 

 [[],[
  ["Assassin Tips",
  "<br />To view the targets Information press INSERT key.
  <br />Targets will be Civilian and Military. To debug and get their exact target position press DEL key"],
  ["WarZones","Altis is a warzone. Battles are erupting across the country between the NATO and CSAT factions.<br />Resistance forces patrol towns to maintain peace and order.
  <br />Beware, Alerting you target to your presence will make all factions target you. Killing innocent civilians will cause all factions to target you! <br />Proceed with caution."],
  ["Credits","Mission created By BangaBob.<br />EOS (Enemy Occupation System) and COS (Civilian Occupation System) By BangaBob.<br /><br />Weather script: code34<br /><br />Task script: Shuko of LDD Kyllikki<br /><br />Holster script: Arctorkovich"]
]] call compile preprocessfilelinenumbers "shk_taskmaster.sqf";

["Task0","Awaiting client instructions","Standby for orders. Please read briefing."] call SHK_Taskmaster_add;



_veh = createVehicle ["Land_Billboard_F", position picture, [], 0, "CAN_COLLIDE"];
_veh attachTo [picture,[0,10,1]]; 

startingVehicle animate ["HidePolice", 1]; 
startingVehicle animate ["HideServices", 1]; 
startingVehicle animate ["HideBackpacks", 0]; 
startingVehicle animate ["HideBumper1", 0]; 
startingVehicle animate ["HideBumper2", 0]; 
startingVehicle animate ["HideConstruction", 0]; 
startingVehicle animate ["HideDoor1", 1];  
startingVehicle animate ["HideDoor2", 1]; 
startingVehicle animate ["HideDoor3", 1]; 
startingVehicle animate ["HideGlass2", 1];

uniforms = ["U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_C_WorkerCoveralls","U_C_ShirtSurfer_shorts","U_C_Poor_1","U_C_Journalist","U_C_HunterBody_grn","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour"];
secondaryWeapons = ["hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F","hgun_Pistol_heavy_01_F"];
startPoints = ["startPos","startPos_1","startPos_2","startPos_3","startPos_4","startPos_5","startPos_6","startpos_7","startpos_8"];
rewardItems = ["optic_NVS","NVGoggles","optic_Hamr","optic_DMS","muzzle_snds_acp","muzzle_snds_L","ItemGPS","Medikit","muzzle_snds_L"];
rewardWeapons = ["srifle_EBR_F","arifle_MXM_F","hgun_PDW2000_Holo_F","arifle_MXC_F"];
_startPoint=startPoints select (floor(random(count startPoints)));

player setpos markerpos  _startPoint;
gearFinish=false;
null=[]execVM "gear\initGear.sqf";

waituntil {gearFinish};
	
	startingVehicle setposATL [(getposATL player select 0),(getposATL player select 1)+5,(getposATL player select 2)];	
	null=[startingVehicle] execVM "addactionVeh.sqf";

		null =[] execVM "selectTarget.sqf";
		(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
		_handle=(findDisplay 46) displaySetEventHandler ["KeyDown","_this call spawnKeys"];
		
		titleText ["", "BLACK IN", 1];