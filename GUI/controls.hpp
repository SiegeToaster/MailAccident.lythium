#include "defines.hpp"

class startSelect {
	idd = 1111;

	class controls {
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
		class startSelect_map: RscMapControl // modified from https://github.com/Riouken/cTab/
		{ // toDo find out how to add text markers
			idc = 561;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.264 * safezoneH;

			maxSatelliteAlpha = 10000;
			alphaFadeStartScale = 10;
			alphaFadeEndScale = 10;

			// Rendering density coefficients
			ptsPerSquareSea = 8 / (0.86 / safezoneH);		// seas
			ptsPerSquareTxt = 8 / (0.86 / safezoneH);		// textures
			ptsPerSquareCLn = 8 / (0.86 / safezoneH);		// count-lines
			ptsPerSquareExp = 8 / (0.86 / safezoneH);		// exposure
			ptsPerSquareCost = 8 / (0.86 / safezoneH);		// cost

			// Rendering thresholds
			ptsPerSquareFor = 3 / (0.86 / safezoneH);		// forests
			ptsPerSquareForEdge = 100 / (0.86 / safezoneH);	// forest edges
			ptsPerSquareRoad = 1.5 / (0.86 / safezoneH);		// roads
			ptsPerSquareObj = 4 / (0.86 / safezoneH);		// other objects
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
			action = "call MailAccident_fnc_setStartingPoint"

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
	};
};
