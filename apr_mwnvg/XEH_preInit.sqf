[
	"apr_mwnvg_var_acecheck",
	"CHECKBOX",
	["Use colorset for ACE", 
"
Enable if you using ACE Nightvision.
"
	],
"Apricot's MW NVG VFX",
true,
0,
true,
false
];

[
    "apr_mwnvg_var_vfxselect", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    ["NOD Color set",
"
Green Phosphor is nothing change from vanilla.\n
Modern Warfare is is the modernized phosphor for Combat operation Duty since 2019.\n
FL White Phosphor is based by Fat_Lurch's WP.\n
"
	], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Apricot's MW NVG VFX", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[0,1,2],["Green Phosphor (Default)","Modern Warfare","FL White Phosphor"]], // data for this setting: [min, max, default, number of shown trailing decimals]
    false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;