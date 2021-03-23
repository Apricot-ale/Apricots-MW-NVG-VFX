[
	"apr_mwnvg_var_acecheck", //_setting
	"CHECKBOX", //_settingType
	[
		"Using Color set for ACE Nightvision",
		"
			Please ENABLE if you using ACE Nightvision module.
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
		Green Phosphor is no different to Vanilla (Arma 3 Default). It is classic and easy on the eyes.\n
		Modern Warfare is a modernised phosphor used for Combat operation Duty (CoD) from 2019 onwards.\n
		FL White Phosphor is based on Fat_Lurch's WP. It is generally used in the NewGen-NVGs.\n
		"
	], //_title
	"Apricot's MW NVG VFX", //_category LIST --- extra arguments: [_values, _valueTitles, _defaultIndex];
	[
		[0,1,2], //_values
		[
			"Green Phosphor",
			"Modern Warfare Phosphor",
			"FL White Phosphor"
		], //_valueTitles
		1 //_defaultIndex
	], //_valueInfo
	0 //_isGlobal
] call cba_settings_fnc_init;