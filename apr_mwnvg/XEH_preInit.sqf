[
	"apr_mwnvg_var_acecheck", //_setting
	"CHECKBOX", //_settingType
	[
		"Using ACE Color set",
		"
			Enable if you using ACE Nightvision.
		"
	], //_title
	"Apricot's MW NVG VFX", //_category CHECKBOX --- extra argument: default value
	false, //_valueInfo default value
	0 //_isGlobal
] call cba_settings_fnc_init;

[
	"apr_mwnvg_var_vfxselect", //_setting
	"LIST", //_settingType
	[
		"NOD Tube Color (NV Color)",
		"
			Green Phosphor is nothing change from vanilla.\n
			Modern Warfare is is the modernized phosphor for Combat operation Duty since 2019.\n
			FL White Phosphor is based by Fat_Lurch's WP.\n
		"
	], //_title
	"Apricot's MW NVG VFX", //_category LIST --- extra arguments: [_values, _valueTitles, _defaultIndex];
	[
		[0,1,2], //_values
		[
			"Green Phosphor (Default-Vanilla)",
			"Modern Warfare Phosphor",
			"FL White Phosphor"
		], //_valueTitles
		0 //_defaultIndex
	], //_valueInfo
	0 //_isGlobal
] call cba_settings_fnc_init;