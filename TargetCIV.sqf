private ["_n","_tempUnit","_tempFace","_tempHat","_tempGlasses","_tempLocation","_rad"];
_grp = createGroup CIVilian;
_grp2 = createGroup CIVilian; 
_facePool = ["AfricanHead_01","AfricanHead_02","AfricanHead_03","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21"];
_InfPool =	["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_w_worker_F"];	
_hatPool = ["H_Cap_blk","H_Cap_blk_CMMG","H_Cap_blk_ION","H_Cap_blk_Raven","H_Cap_blu","H_Cap_brn_SPECOPS","H_Cap_grn","H_Cap_grn_BI","H_Cap_headphones","H_Cap_khaki_specops_UK","H_Cap_oli","H_Cap_oli_hs","H_Cap_press","H_Cap_red","H_Cap_tan","H_Hat_blue","H_Hat_brown","H_Hat_camo","H_Hat_checker","H_Hat_grey","H_Hat_tan","H_Shemag_khk","H_StrawHat","H_StrawHat_dark","H_TurbanO_blk","H_Watchcap_blk","H_Watchcap_camo","H_Watchcap_khk","H_Watchcap_sgg"];
_rankPool = ["CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
_glassesPool = ["G_Aviator","G_Lady_Blue","G_Lady_Dark","G_Lady_Mirror","G_Lady_Red","G_Lowprofile","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","G_Spectacles","G_Spectacles_Tinted","G_Sport_Blackred","G_Sport_BlackWhite","G_Sport_Blackyellow","G_Sport_Checkered","G_Sport_Greenblack","G_Sport_Red","G_Squares","G_Squares_Tinted","None"];
_weaponPool = ["arifle_Katiba_ACO_F","arifle_Mk20_ACO_F","arifle_MX_ACO_F","arifle_MXC_ACO_F","arifle_TRG20_ACO_F","SMG_01_ACO_F","srifle_DMR_01_ACO_F"];

_tempUnit=_InfPool select (floor(random(count _InfPool)));
_tempFace = _facePool select (floor(random(count _facePool)));
_tempHat=_hatPool select (floor(random(count _hatPool)));
_tempRank=_rankPool select (floor(random(count _rankPool)));
_tempGlasses=_glassesPool select (floor(random(count _glassesPool)));
_tempWeapon=_weaponPool select (floor(random(count _weaponPool)));

_closesttown = (nearestLocations [player,["NameCityCapital","NameCity","NameVillage"],RANGE]);
_tempLocation = _closesttown select (floor(random(count _closesttown)));


target = _grp createUnit [_tempUnit, position _tempLocation, [], 25, "NONE"];
_n=0;
_rad=50;
_roadlist = getpos target nearRoads _rad;
_spawnpos =_roadlist select _n;

while {isnil "_spawnpos"} do {
	_rad=_rad+_rad;
		_roadlist= getpos _tempLocation nearRoads _rad;
		_spawnpos=_roadlist select 0;
			sleep 0.1;
	};
	
target setpos (getpos _spawnpos);
pictureMan = _grp2 createUnit [_tempUnit, position picture, [], 25, "NONE"];
target setRank _tempRank;

	{
 _x setFace _tempFace;
 removeHeadgear _x;
 sleep 0.1;
 _x addHeadgear _tempHat; 
 _X  addGoggles _tempGlasses;
	}foreach [pictureMan,target];
	
	{
 pictureMan disableAI _x;
	}foreach ["FSM","MOVE","AUTOTARGET","TARGET","ANIM"];
	pictureMan enablesimulation false;	
pictureMan addWeapon _tempWeapon;
pictureMan attachTo [picture,[0,3,0]]; 
pictureMan setdir 180;
 
TargetType = "CIVZONE";
null= [_roadlist] execVM "assignTask.sqf";