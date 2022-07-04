/*

	SIA Mission Framework (https://github.com/Soliders-in-Arms-Arma-3-Group/SIA-Mission-Framework.VR.git)
	Author: McKendrick

=====================================================================

	Description:
		Configuration option to add items to the arsenals' of specific roles and/or to the arsenal globally.
		NOTE that the gear each player spawns in with is already added to their local arsenal.

	USAGE:
		Run locally.

	PARAMS:
		0: Array of objects to act as arsenals.
*/
// =======================================================================================
// DO NOT DELETE OR EDIT vvv

if (!hasInterface) exitWith {}; // Exit if not player
private _arsenals = _this select 0;
if (typeName _arsenals != "ARRAY") exitWith {["Incorrect format: %1", _arsenals] call BIS_fnc_error}; // Exit if array not given.
private _role = player getVariable ["role", "none"];
private _roleItems = [];
private _presets = [];
private _globalArsenal = [];

// DO NOT DELETE OR EDIT ^^^
// =======================================================================================
// Declare items to add to the arsenal globally (for everyone), in the brackets with quotation marks and seperated by a comma.
// Compatible with the "Export" function on the in-game attribute Arsenal editor.
_globalArsenal = ["VSM_Scorpion_Crye_Camo", "VSM_Scorpion_Crye_od_shirt_Camo", "VSM_Scorpion_Crye_od_pants_Camo", "VSM_FAPC_Breacher_OGA_OD", "VSM_FAPC_MG_OGA_OD", "VSM_FAPC_Operator_OGA_OD", "VSM_CarrierRig_Breacher_OGA_OD", "VSM_CarrierRig_Gunner_OGA_OD", "VSM_CarrierRig_Operator_OGA_OD", "VSM_LBT6094_breacher_OGA_OD", "VSM_LBT6094_MG_OGA_OD", "VSM_LBT6094_operator_OGA_OD", "VSM_RAV_Breacher_OGA_OD", "VSM_RAV_MG_OGA_OD", "VSM_RAV_operator_OGA_OD", "VSM_OGA_OD_carryall", "VSM_OGA_OD_Backpack_Compact", "VSM_OGA_OD_Backpack_Kitbag", "rhsusf_mich_bare_norotos_alt_semi_headset", "rhsusf_mich_bare_norotos_alt_semi", "rhsusf_mich_bare_norotos_semi", "rhsusf_mich_bare_semi_headset", "rhsusf_mich_bare_alt_semi", "rhsusf_mich_bare_semi", "rhsusf_ANPVS_14", "rhsusf_ANPVS_15", "rhsusf_Rhino", "rhsusf_bino_leopold_mk4", "rhsusf_bino_m24", "rhsusf_bino_m24_ARD", "Binocular","VSM_Balaclava_black_glasses","VSM_Balaclava_OD_glasses","VSM_Balaclava_tan_glasses","VSM_Balaclava_black_Goggles","VSM_Balaclava_OD_Goggles","VSM_Balaclava_tan_Goggles","VSM_Balaclava_black_Peltor","VSM_Balaclava_OD_Peltor","VSM_Balaclava_tan_Peltor","VSM_Balaclava_black_Peltor_glasses","VSM_Balaclava_OD_Peltor_glasses","VSM_Balaclava_tan_Peltor_glasses","VSM_Balaclava_black_Peltor_Goggles","VSM_Balaclava_OD_Peltor_Goggles","VSM_Balaclava_tan_Peltor_Goggles","VSM_Balaclava2_black_glasses","VSM_Balaclava2_OD_glasses","VSM_Balaclava2_tan_glasses","VSM_Balaclava2_black_Goggles","VSM_Balaclava2_OD_Goggles","VSM_Balaclava2_tan_Goggles","VSM_Balaclava2_black_Peltor","VSM_Balaclava2_OD_Peltor","VSM_Balaclava2_tan_Peltor","VSM_Balaclava2_black_Peltor_glasses","VSM_Balaclava2_OD_Peltor_glasses","VSM_Balaclava2_tan_Peltor_glasses","VSM_Balaclava2_black_Peltor_Goggles","VSM_Balaclava2_OD_Peltor_Goggles","VSM_Balaclava2_tan_Peltor_Goggles","VSM_Facemask_black_glasses","VSM_Facemask_OD_glasses","VSM_Facemask_tan_glasses","VSM_Facemask_black_Goggles","VSM_Facemask_OD_Goggles","VSM_Facemask_tan_Goggles","VSM_Facemask_black_Peltor","VSM_Facemask_OD_Peltor","VSM_Facemask_tan_Peltor","VSM_Facemask_black_Peltor_glasses","VSM_Facemask_OD_Peltor_glasses","VSM_Facemask_tan_Peltor_glasses","VSM_Facemask_black_Peltor_Goggles","VSM_Facemask_OD_Peltor_Goggles","VSM_Facemask_tan_Peltor_Goggles","VSM_Goggles","VSM_Peltor_AOR1_glasses","VSM_Peltor_coyote_glasses","VSM_Peltor_m81_glasses","VSM_Peltor_OCP_glasses","VSM_Peltor_OD_glasses","VSM_Shemagh_OD","VSM_Shemagh_tan","VSM_Shemagh_Balaclava_OD","VSM_Shemagh_Balaclava_tan","VSM_Shemagh_Balaclava_OD_Glasses","VSM_Shemagh_Balaclava_tan_Glasses","VSM_Shemagh_Balaclava_OD_Goggles","VSM_Shemagh_Balaclava_tan_Goggles","VSM_Shemagh_Balaclava_OD_Peltor","VSM_Shemagh_Balaclava_tan_Peltor","VSM_Shemagh_Balaclava_OD_Peltor_Glasses","VSM_Shemagh_Balaclava_tan_Peltor_Glasses","VSM_Shemagh_Balaclava_OD_Peltor_Goggles","VSM_Shemagh_Balaclava_tan_Peltor_Goggles","VSM_Shemagh_Balaclava2_OD","VSM_Shemagh_Balaclava2_tan","VSM_Shemagh_Balaclava2_OD_Glasses","VSM_Shemagh_Balaclava2_tan_Glasses","VSM_Shemagh_Balaclava2_OD_Goggles","VSM_Shemagh_Balaclava2_tan_Goggles","VSM_Shemagh_Balaclava2_OD_Peltor","VSM_Shemagh_Balaclava2_tan_Peltor","VSM_Shemagh_Balaclava2_OD_Peltor_Glasses","VSM_Shemagh_Balaclava2_tan_Peltor_Glasses","VSM_Shemagh_Balaclava2_OD_Peltor_Goggles","VSM_Shemagh_Balaclava2_tan_Peltor_Goggles","VSM_Shemagh_Facemask_OD","VSM_Shemagh_Facemask_tan","VSM_Shemagh_Facemask_OD_Glasses","VSM_Shemagh_Facemask_tan_Glasses","VSM_Shemagh_Facemask_OD_Goggles","VSM_Shemagh_Facemask_tan_Goggles","VSM_Shemagh_Facemask_OD_Peltor","VSM_Shemagh_Facemask_tan_Peltor","VSM_Shemagh_Facemask_OD_Peltor_Glasses","VSM_Shemagh_Facemask_tan_Peltor_Glasses","VSM_Shemagh_Facemask_OD_Peltor_Goggles","VSM_Shemagh_Facemask_tan_Peltor_Goggles","VSM_Shemagh_glasses_OD","VSM_Shemagh_glasses_tan","VSM_Shemagh_goggles_od","VSM_Shemagh_goggles_tan","G_Aviator","rhs_googles_black","rhs_googles_clear","rhs_googles_orange","rhs_googles_yellow","rhs_ess_black","G_Combat","G_Combat_Goggles_tna_F","UK3CB_G_KLR_BLK","UK3CB_G_KLR_Oli","UK3CB_G_KLR_TAN","UK3CB_G_KL_BLK","UK3CB_G_KL_Oli","UK3CB_G_KL_TAN","G_Lowprofile","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","rhsusf_shemagh_grn","rhsusf_shemagh2_grn","rhsusf_shemagh_od","rhsusf_shemagh2_od","rhsusf_shemagh_tan","rhsusf_shemagh2_tan","rhsusf_shemagh_gogg_grn","rhsusf_shemagh2_gogg_grn","rhsusf_shemagh_gogg_od","rhsusf_shemagh2_gogg_od","rhsusf_shemagh_gogg_tan","rhsusf_shemagh2_gogg_tan","rhsusf_oakley_goggles_blk","rhsusf_oakley_goggles_clr","rhsusf_oakley_goggles_ylw","G_Squares","G_Tactical_Clear","G_Tactical_Black","G_WirelessEarpiece_F","G_Respirator_white_F","G_Respirator_blue_F","G_Respirator_yellow_F","hgun_Pistol_heavy_02_F","rhsusf_weap_glock17g4","rhsusf_weap_m1911a1","rhsusf_weap_m9","6Rnd_45ACP_Cylinder","rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_7x45acp_MHP","9Rnd_45ACP_Mag","rhsusf_mag_15Rnd_9x19_JHP","rhsusf_mag_15Rnd_9x19_FMJ", "rhs_weap_m4a1_blockII_d", "rhs_weap_m4a1_blockII_KAC_d", "rhsusf_acc_acog2_usmc", "rhsusf_acc_acog3_usmc", "rhsusf_acc_acog_usmc", "rhsusf_acc_g33_t1", "rhsusf_acc_g33_xps3", "rhsusf_acc_g33_xps3_tan", "rhsusf_acc_acog", "rhsusf_acc_acog2", "rhsusf_acc_acog3", "rhsusf_acc_eotech_552", "rhsusf_acc_eotech_552_d", "rhsusf_acc_compm4", "rhsusf_acc_su230", "rhsusf_acc_su230_c", "rhsusf_acc_su230_mrds", "rhsusf_acc_su230_mrds_c", "rhsusf_acc_su230a", "rhsusf_acc_su230a_c", "rhsusf_acc_su230a_mrds", "rhsusf_acc_su230a_mrds_c", "rhsusf_acc_acog_rmr", "rhsusf_acc_acog_d", "rhsusf_acc_anpeq15_wmx", "rhsusf_acc_anpeq15_wmx_light", "rhsusf_acc_anpeq15", "rhsusf_acc_anpeq15_light", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_anpeq15_bk_light", "rhsusf_acc_anpeq16a", "rhsusf_acc_anpeq16a_light", "rhsusf_acc_anpeq16a_top", "rhsusf_acc_anpeq16a_light_top", "rhsusf_acc_nt4_black", "rhsusf_acc_nt4_tan", "rhsusf_acc_grip2", "rhsusf_acc_grip2_tan", "rhsusf_acc_grip1", "rhsusf_acc_harris_bipod", "rhsusf_acc_kac_grip", "rhsusf_acc_tacsac_blk", "rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger", "rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger_Tracer_Red", "ACE_M14","rhs_mag_an_m8hc","Chemlight_blue","Chemlight_green","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiRed","ACE_Chemlight_HiWhite","ACE_Chemlight_HiYellow","ACE_Chemlight_IR","ACE_Chemlight_Orange","Chemlight_red","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_White","Chemlight_yellow","ACE_HandFlare_Green","ACE_HandFlare_Red","ACE_HandFlare_White","ACE_HandFlare_Yellow","rhs_mag_m18_green","rhs_mag_m18_purple","rhs_mag_m18_red","rhs_mag_m18_yellow","rhs_mag_m67","rhs_mag_mk84","ACE_Banana","ACE_Sunflower_Seeds"];

// Configure presets. You may also define what roles are considered infantry below, or create additional presets using the same format.
_presets = [

	// Infantry Preset
	[
		["ItemCompass","SmokeShell"], // Classnames of items to to add, seperated by a comma.
		["r", "at", "tl", "sql", "medic", "pltsgt", "pltco"] // Roles to apply it to.
	],
	
	// Leadership Preset
	[
		["rhs_weap_M320", "rhsusf_bino_lerca_1200_black", "rhsusf_bino_lerca_1200_tan", "ACE_VectorDay", "ACE_Vector", "rhs_weap_m4a1_blockII_M203_d","rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Green","rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Yellow","rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Orange","rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Orange","rhs_mag_M441_HE","rhs_mag_M433_HEDP","rhs_mag_M397_HET","rhs_mag_m576","rhs_mag_m4009","rhs_mag_M583A1_white","rhs_mag_m661_green","rhs_mag_m662_red","rhs_mag_M585_white_cluster","rhs_mag_M663_green_cluster","rhs_mag_M664_red_cluster","rhs_mag_m713_Red","rhs_mag_m714_White","rhs_mag_m715_Green","rhs_mag_m716_yellow","rhs_mag_M585_white","ACE_40mm_Flare_white","ACE_40mm_Flare_red","ACE_40mm_Flare_green","ACE_40mm_Flare_ir","ACE_HuntIR_M203","ACE_HuntIR_monitor"],
		["tl","sql","pltsgt","pltco"]
	]

];
// =======================================================================================
// DO NOT DELETE OR EDIT vvv
switch (_role) do
{
// DO NOT DELETE OR EDIT ^^^
// =======================================================================================
// Configure role-specific local arsenals.
// Enter classnames of items in the brackets with quotation marks and seperated by a comma. You can also add your own roles by following the format.
// Example: case "r" : { _roleItems = ["RHS_M4","Binoculars","SmokeGrenade"] };

	// Rifleman
	case "r" : { _roleItems = [] };

	// Autorifleman
	case "ar" : { _roleItems = ["rhs_mag_100Rnd_556x45_M855A1_cmag", "rhs_mag_100Rnd_556x45_M855A1_cmag_mixed"] };

	// Medium Anti-tank
	case "at" : { _roleItems = ["rhs_weap_M136", "rhs_weap_M136_hedp", "rhs_weap_M136_hp", "rhs_weap_m72a7"] };

	// Team Leader
	case "tl" : { _roleItems = [] };

	// Squad Leader
	case "sql" : { _roleItems =  [] };
	
	// Medic
	case "medic" : { _roleItems = [] };
	
	// Platoon Sergeant
	case "pltsgt" : { _roleItems = [] };
	
	// Platoon Lead
	case "pltco" : { _roleItems = [] };

	// Game Master
	case "gm" : { _roleItems = [] };

	case "marksman": { _roleItems = ["rhsusf_acc_aac_762sd_silencer","rhs_weap_sr25","rhs_weap_sr25_d","rhs_weap_sr25_ec","rhs_weap_sr25_ec_d","rhsusf_acc_m8541","rhsusf_acc_m8541_d","rhsusf_acc_m8541_mrds","rhsusf_acc_leupoldmk4_2","rhsusf_acc_leupoldmk4_2_d","rhsusf_acc_leupoldmk4_2_mrds","ACE_ATragMX","ACE_DAGR","ACE_Kestrel4500","ACE_SpottingScope","ACE_VectorDay","ACE_Vector"] };

	// No role given
	case "none" : { _roleItems = [] };


// =======================================================================================
// DO NOT DELETE OR EDIT vvv

	// Role not listed error
	default { [" Role not listed in config: %1", _role] call BIS_fnc_error }; // Log error if role not listed.
};
private _arsenalContents = _roleItems + _globalArsenal;
{[_x, _arsenalContents, false] call ace_arsenal_fnc_addVirtualItems} forEach sia_f_arsenals;

{
	_presetItems = _x select 0;
	_presetRoles = _x select 1;

	if (_role in _presetRoles) then  {{[_x, _presetItems, false] call ace_arsenal_fnc_addVirtualItems} forEach sia_f_arsenals};

} forEach _presets;