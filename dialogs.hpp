class RscTitles
{
          class Default 
         {
            idd = -1;
            fadein = 0;
            fadeout = 0;
            duration = 0;
         };
    class hudDisplay
    {
        idd = 1000000;
        movingEnable =  1;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  0.1;
        fadeout      =  2;
        name = "hudDisplay";
		onLoad = "with uiNameSpace do { hudDisplay = _this select 0 }";
	class controls 
        {
	class RscBox: Box
		{
	idc = 1999;
	text = "picture\ID.jpg";
	x = 0.65 * safezoneW + safezoneX;
	y = 0.125 * safezoneH + safezoneY;
	w = 0.27 * safezoneW;
	h = 0.21 * safezoneH;
		};
	class RscPicture_1200: RSC_picture
			{
		idc = 1200;
		text = "";
		x = 0.82135 * safezoneW + safezoneX;
		y = 0.13832 * safezoneH + safezoneY;
		w = 0.088 * safezoneW;
		h = 0.1218 * safezoneH;
			};
        class text
            {
                access = 0;
                type = 13;
                idc = 1000001;
                style = 0x00;
                lineSpacing = 1;
				x = 0.655 * safezoneW + safezoneX;
				y = 0.135 * safezoneH + safezoneY;
				w = 0.145 * safezoneW;
				h = 0.2 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0};
                colorText[] = {1,1,1,1};
                text = "Name.";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FC381B";
						align = "CENTER";
						valign = "top";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "2";
								}; 
            };
        class eliminatedText
            {
                access = 0;
                type = 13;
                idc = 1980;
                style = 0x00;
                lineSpacing = 1;
				x = 0.645 * safezoneW + safezoneX;
				y = 0.135 * safezoneH + safezoneY;
				w = 0.28 * safezoneW;
				h = 0.2 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0};
                colorText[] = {1,1,1,1};
                text = "Target Eliminated";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FC381B";
						align = "CENTER";
						valign = "top";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "2";
								}; 
            };
        };
    };
	
    class statDisplay
    {
        idd = 505;
        movingEnable =  1;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  0.1;
        fadeout      =  2;
        name = "statDisplay";
		onLoad = "with uiNameSpace do { statDisplay = _this select 0 }";
	class controls 
        {
	class rscStatBackground: Box
		{
	idc = 1203;
	text = "picture\playerID2.jpg";
	x = 0.78 * safezoneW + safezoneX;
	y = 0.425 * safezoneH + safezoneY;
	w = 0.14 * safezoneW;
	h = 0.165 * safezoneH;
		};
        class rscStatText
            {
                access = 0;
                type = 13;
                idc = 1000002;
                style = 0x00;
                lineSpacing = 2;
				x = 0.83 * safezoneW + safezoneX;
				y = 0.472 * safezoneH + safezoneY;
				w = 0.145 * safezoneW;
				h = 0.2 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0};
                colorText[] = {1,1,1,1};
                text = "";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FC381B";
						align = "CENTER";
						valign = "top";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "2";
								}; 
            };
        class wantedText
            {
                access = 0;
                type = 13;
                idc = 1204;
                style = 0x00;
                lineSpacing = 1;
				x = 0.78 * safezoneW + safezoneX;
				y = 0.6 * safezoneH + safezoneY;
				w = 0.145 * safezoneW;
				h = 0.2 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0};
                colorText[] = {1,1,1,1};
                text = "Target Eliminated";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FC381B";
						align = "CENTER";
						valign = "top";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "2";
								}; 
            };
        class wantedText2
            {
                access = 0;
                type = 13;
                idc = 1205;
                style = 0x00;
                lineSpacing = 1;
				x = 0.78 * safezoneW + safezoneX;
				y = 0.7 * safezoneH + safezoneY;
				w = 0.145 * safezoneW;
				h = 0.2 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0};
                colorText[] = {1,1,1,1};
                text = "Target Eliminated";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FC381B";
						align = "CENTER";
						valign = "top";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "2";
								}; 
            };
        };
    };
	
    class gearDisplay
    {
        idd = 900;
        movingEnable =  1;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  0.1;
        fadeout      =  2;
        name = "gearDisplay";
		onLoad = "with uiNameSpace do { gearDisplay = _this select 0 }";
	class controls 
        {
    class geardisplayText
        {
             access = 0;
                type = 13;
                idc = 902;
                style = 0x00;
                lineSpacing = 2;
				x = 0.35 * safezoneW + safezoneX;
				y = 0.8 * safezoneH + safezoneY;
				w = 0.3 * safezoneW;
				h = 0.3 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0};
                colorText[] = {1,1,1,1};
                text = "Use W&S to select weapon. A&D to select uniform";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FC381B";
						align = "CENTER";
						valign = "top";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "2";
								}; 
            };
    class geardisplayWeaponUniform
        {
             access = 0;
                type = 13;
                idc = 903;
                style = 0x00;
                lineSpacing = 2;
				x = 0.35 * safezoneW + safezoneX;
				y = 0.2 * safezoneH + safezoneY;
				w = 0.3 * safezoneW;
				h = 0.3 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0};
                colorText[] = {1,1,1,1};
                text = "";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FC381B";
						align = "CENTER";
						valign = "top";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "3";
								}; 
            };
        };
    };
};