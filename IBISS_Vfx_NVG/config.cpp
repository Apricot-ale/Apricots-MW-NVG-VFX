class CfgPatches
{
	class IBISS_Vfx_NVG
	{
		// Meta information for editor
		name = "IBISS Vfx NVG";
		author = "Apricot_ale";
		url = "";

		requiredVersion = 1.90;
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
	class IBISS
	{
		class Vfx
		{
			class NVG_HV {file = "IBISS_Vfx_NVG\functions\NVG_HV.sqf";};
			class NVG_MW {file = "IBISS_Vfx_NVG\functions\NVG_MW.sqf";};
			class NVG_WP {file = "IBISS_Vfx_NVG\functions\NVG_WP.sqf";};
		};
	};
};
class Extended_PreInit_EventHandlers
{
	class IBISS_Vfx_NVG_XEH
	{
		init = "call compile preprocessFileLineNumbers 'IBISS_Vfx_NVG\XEH_preInit.sqf'";
	};
};
class Extended_Init_EventHandlers
{
	class CAManBase
	{
		class NVG_HV_init
		{
			init = "[] spawn IBISS_fnc_NVG_HV";
		};
		class NVG_MW_init
		{
			init = "[] spawn IBISS_fnc_NVG_MW";
		};
		class NVG_WP_init
		{
			init = "[] spawn IBISS_fnc_NVG_WP";
		};
	};
};
