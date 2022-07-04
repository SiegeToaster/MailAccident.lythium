/*

	SIA Mission Framework (https://github.com/Soliders-in-Arms-Arma-3-Group/SIA-Mission-Framework.VR.git)
	Author: McKendrick

=====================================================================

	Description:
		Adds briefing for blufor players to the mission.
		For more information on briefing formatting, see https://community.bistudio.com/wiki/Arma_3:_Briefing
		For an example of a briefing, see https://docs.google.com/document/d/1o6i-wvIkhs4APs_QetKSZI35yEy8_7CHz8u_ZGcM_3g/edit?usp=sharing

	USAGE:
		Run locally.

	PARAMS: None
*/
//=======================================================================================
// Put briefing in the quotations below.

_situation = "Some time ago, Major Pvt. Spectre (the HVT) was captured by the local insurgents while inspecting the area north of the town of Afsher.  He is currently being held captive somewhere in that area, and now we need to rescue her.
<br></br><br></br<br></br><br></br>RAID: Shadow Legends™️ is an immersive online experience with everything you'd expect from a brand new RPG title. It's got an amazing storyline, awesome 3D graphics, giant boss fights, PVP battles, and hundreds of never before seen champions to collect and customize.
<br></br><br></br>I never expected to get this level of performance out of a mobile game. Look how crazy the level of detail is on these champions!
<br></br><br></br>RAID: Shadow Legends™️ is getting big real fast, so you should definitely get in early. Starting now will give you a huge head start. There's also an upcoming Special Launch Tournament with crazy prizes! And not to mention, this game is absolutely free!
<br></br><br></br>So go ahead and check out the video description to find out more about RAID: Shadow Legends™️. There, you will find a link to the store page and a special code to unlock all sorts of goodies. Using the special code, you can get 50,000 Silver immediately, and a FREE Epic Level Champion as part of the new players program, courtesy of course of the RAID: Shadow Legends™️ devs.
";

_mission = "Your mission is to locate and rescue a US Army representative of the United Nations.
<br></br><br></br><img image='images\hvt.paa' width='128' height='256'/>";

_execution = "There are two informants that we think may be able to provide information relating to the HVT's location.  The <marker name = 'mrk_inf1'>first</marker> is on the eastern side of the AO, and the <marker name = 'mrk_inf2'>second</marker> is in the south-west.  It would be best to start your search there.
<br></br><br></br>We know of a <marker name = 'mrk_AAA'>AAA Emplacement</marker> in the AO.  LZ Balcony will remain closed until the AAA here is confirmed to be disabled or destroyed.
<br></br><br></br>The <marker name = 'mrk_insBase'>Insurgent Main Base</marker> may contain valuable intel on the HVT's location.  However, it is very well defended.";

_support = "<font color='#FF0000'>Big Iron</font> - Command.  Radio command to request any support elements.
<br></br><br></br><font color='#FF0000'>November 1</font> - CH-47F.
<br></br><br></br><font color='#FF0000'>November 2</font> - UH-60M.
<br></br><br></br><font color='#FF0000'>Evac Points</font> - A platoon of motorized infantry supported by armor is stationed at each of the evac points.";

_signal = "<font color='#FF0000'>343 Channels</font>
<br></br>Ch 1 - Alpha
<br></br>Ch 2 - Bravo
<br></br>Ch 3 - Charlie
<br></br>Ch 6 - Plt Co
<br></br><br></br><font color='#FF0000'>152/117F Channels</font>
<br></br>Ch 1 - PLATOON NET";

// =======================================================================================
// DO NOT DELETE OR EDIT vvv

[[["Signal", _signal], ["Support", _support], ["Execution", _execution], ["Mission", _mission], ["Situation", _situation]]] execVM "sia_f\briefing\createBriefing.sqf";
