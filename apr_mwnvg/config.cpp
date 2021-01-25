class CfgPatches
{
	class apr_mwnvg
	{
		// Meta information for editor
		name = "Apricot's MW NVG VFX";
		author = "Apricot_ale";
		url = "";

		requiredVersion = 2.00;
		requiredAddons[] = 
		{
			"cba_main",
			"ace_main",
			"ace_common",
			"ace_interaction"
		};
		// List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content unlocking.
		units[] = {};
		// List of weapons (CfgWeapons classes) contained in the addon.
		weapons[] = {};
	};
};
class CfgFunctions
{
	class apr_mwnvg
	{	
		class nod {file = "apr_mwnvg\functions\nvgvfx.sqf";};
	};
};
class Extended_PreInit_EventHandlers
{
	class apr_mwnvg_XEH
	{
		init = "call compile preprocessFileLineNumbers 'apr_mwnvg\XEH_preInit.sqf'";
	};
};
class Extended_Init_EventHandlers
{
	class CAManBase
	{
		class apr_mwnvg_init
		{
			init = "[] spawn apr_mwnvg_fnc_nod";
		};
	};
};