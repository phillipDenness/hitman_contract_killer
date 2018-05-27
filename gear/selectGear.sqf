disableSerialization;
private ["_displayName"];
_next=(_this select 0);
_uniform=(_this select 1);
_display = uiNameSpace getVariable "gearDisplay";

if _uniform then {
if _next then {selection=selection+1;}else{selection=selection-1;};
_countUniforms=count uniforms;

if (selection < 0) then {selection=0;};
if (selection > (_countUniforms-1)) then {selection=(_countUniforms-1);};
_uniform=uniforms select selection;
	_displayName = getText (configFile / "CfgWeapons" / _uniform / "displayname");
	puppet addUniform _uniform; 
	
	
		}else{
	
	
if _next then {selectionGun=selectionGun+1;}else{selectionGun=selectionGun-1;};
_countWeapons=count secondaryWeapons;

if (selectionGun < 0) then {selectionGun=0;};
if (selectionGun > (_countWeapons-1)) then {selectionGun=(_countWeapons-1);};

	_weapon=secondaryWeapons select selectionGun;
	_displayName = getText (configFile / "CfgWeapons" / _weapon / "displayname");
	 removeallweapons puppet;
	puppet addWeapon _weapon;
		};
		
(_display displayCtrl 903) ctrlSetStructuredText
(parseText format [
"<t align='Center' color='#FFFFFF' shadow='0' >%1</t><br/><br/>" 
,_displayName]);