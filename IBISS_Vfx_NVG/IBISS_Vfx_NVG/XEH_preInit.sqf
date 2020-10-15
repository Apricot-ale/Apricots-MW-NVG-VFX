[
    "IBISS_Vfx_NVG_Setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    ["Night Vision Goggle Phosphor Tubes","NVGs Phosphor Colors"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Apricot's NVG VFX", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[0,1,2,3],["Green Phosphor (Default)","Hybrid","Modern Warfare","White Phosphor"]], // data for this setting: [min, max, default, number of shown trailing decimals]
    false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;