/* Respawn Template Options
Add or remove the following templates in the line of code below to configure your respawn settings.
SEE https://community.bistudio.com/wiki/Arma_3:_Respawn#Official_Templates for more info.

	"ace_spectator": Enables ACE spectator during respawn.
	"Wave": Players who die around the same time as eachother will have their respawn timer synced.
	"Counter": Display respawn countdown.
	"Tickets": Enables respawn tickets system.

*/

respawnTemplates[] = {"ace_spectator","Counter","Tickets", "MenuPosition"}; // RESPAWN SETTINGS. 

// ==================================================================================

author = "Siege";  // YOUR NAME

onLoadName = "Mail Accident"; // THE MISSION'S NAME 

onLoadMission = "US Special Forces attempt to capture an HVT."; // LOADING SCREEN TEXT

//loadScreen = "loadScreen.jpg"; // OPTIONAL LOADING SCREEN IMAGE (must be a 2:1 .JPG or .PAA file in your mission folder)

respawnDelay=30; // RESPAWN TIMER IN SECONDS. NOTE: IF USING TEMPLATE "Wave", RESPAWN DELAY IS THE MEDIAN RESPAWN TIME, NOT MAX 
