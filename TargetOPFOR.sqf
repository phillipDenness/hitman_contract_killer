private ["_tempUnit","_tempFace","_tempHat","_tempGlasses","_counter","_rad"];
_grp = createGroup CIVilian;
_grp2 = createGroup CIVilian; 
_facePool = ["AfricanHead_01","AfricanHead_02","AfricanHead_03","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21"];
_hatPool = ["H_Cap_blk","H_Cap_blk_CMMG","H_Cap_blk_ION","H_Cap_blk_Raven","H_Cap_brn_SPECOPS","H_Cap_headphones","H_Cap_khaki_specops_UK","H_Cap_oli","H_Cap_oli_hs","H_Cap_tan","H_Hat_brown","H_Hat_camo","H_Hat_checker","H_Hat_grey","H_Hat_tan","H_Shemag_khk","H_StrawHat_dark","H_TurbanO_blk","H_Watchcap_blk","H_Watchcap_camo","H_Watchcap_khk","H_Watchcap_sgg"];
_rankPool = ["CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
_glassesPool = ["G_Aviator","G_Lowprofile","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","G_Spectacles","G_Spectacles_Tinted","G_Sport_Blackred","G_Sport_BlackWhite","G_Sport_Blackyellow","G_Sport_Checkered","G_Sport_Greenblack","None"];
_REDPool=	["O_SoldierU_SL_F","O_soldierU_repair_F","O_soldierU_medic_F","O_sniper_F","O_Soldier_A_F","O_Soldier_AA_F","O_Soldier_AAA_F","O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AR_F","O_Soldier_AT_F","O_soldier_exp_F","O_Soldier_F","O_engineer_F","O_engineer_U_F","O_medic_F","O_recon_exp_F","O_recon_F","O_recon_JTAC_F","O_recon_LAT_F","O_recon_M_F","O_recon_medic_F","O_recon_TL_F"];	

OPFORmarkers=OPFORmarkers call BIS_fnc_arrayShuffle;
_countMkrs=count OPFORmarkers;
_counter=0;
{
_counter=_counter+1;
if (_countMkrs == _counter) then {lastMarker=_x};
if ((markerpos _X DISTANCE player < RANGE) and (markerpos _X distance player > 1000)) exitwith {lastMarker=_x;};
}foreach OPFORmarkers;

_tempUnit=_REDPool select (floor(random(count _REDPool)));
_tempFace = _facePool select (floor(random(count _facePool)));
_tempHat=_hatPool select (floor(random(count _hatPool)));
_tempRank=_rankPool select (floor(random(count _rankPool)));
_tempGlasses=_glassesPool select (floor(random(count _glassesPool)));

_pos = [lastMarker,false] call SHK_pos;
target = _grp createUnit [_tempUnit, _pos, [], 25, "NONE"];

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
pictureMan attachTo [picture,[0,3,0]]; 
pictureMan setdir 180; 

TargetType = "WarzoneOPF";
null= [] execVM "assignTask.sqf";