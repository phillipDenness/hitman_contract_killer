if (isnil "SERVER") then {Hint "You must ADD a object named SERVER";Player Sidechat "You must ADD a object named SERVER";}else{
if (isServer) then {populating_EOS=false;eos_Complete=false;publicvariable "eos_Complete";

debugEOS_L=false;
eos_Remember=false;
eos_L_showMarker=false;
eos_L_ArielActivation=true;

OPFORmarkers=["warZone01","warZone03","warZone05","warZone07","warZone09","warZone11","warZone13","warZone15"];
BLUFORmarkers=["warZone02","warZone04","warZone06","warZone08","warZone10","warZone12","warZone14","warZone16"];

null=[1,350,BLUFORmarkers,[0,1],[4,2],[1,0],[1,0]]call eos_Init;
null=[0,350,OPFORmarkers,[0,1],[4,2],[1,0],[1,0]]call eos_Init;


	
eos_Complete=true;publicvariable "eos_Complete";
};

//LOCAL SCRIPTS
WAITUNTIL {eos_Complete};
};