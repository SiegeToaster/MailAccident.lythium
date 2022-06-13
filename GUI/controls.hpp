#include "defines.hpp"

class startSelect {
	idd = 1111;

	class controls {
				////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Siege, v1.063, #Woqazy)
		////////////////////////////////////////////////////////

		class startSelect_background: RscPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class startSelect_title: RscPicture
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.5)";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class startSelect_titleText: RscText
		{
			idc = 1000;

			text = "Choose Starting Point"; //--- ToDo: Localize;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class startSelect_map: RscMapControl
		{
			idc = 561;
			scaleDefault = 0.1;
			widthRailWay = 4; // undefined thing

			x = 0.474219 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class startSelect_selectSquad: RscListbox
		{
			idc = 1501;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class startSelect_selectSquadTitle: RscPicture
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.5)";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class startSelect_selectSquadTitleText: RscText
		{
			idc = 1000;

			text = "Select Squad"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class startSelect_selectStart: RscListBox
		{
			idc = 1500;
			onLBSelChanged = "_this call MailAccident_fnc_changeStartingPoint";

			x = 0.371094 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class startSelect_selectStartTitle: RscPicture
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.5)";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class startSelect_selectStartTitleText: RscText
		{
			idc = 1000;

			text = "Select Starting Point"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class startSelect_Ok: RscButton
		{
			idc = 1600;

			x = 0.551562 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class startSelect_OkText: RscText
		{
			idc = 1001;

			text = "OK"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class startSelect_Cancel: RscButton
		{
			idc = 1601;
			action = "closeDialog 2";

			x = 0.365937 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class startSelect_CancelText: RscText
		{
			idc = 1002;

			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};
