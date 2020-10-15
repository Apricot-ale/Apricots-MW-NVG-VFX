if (isDedicated) exitWith {};
if (isServer && (not hasInterface)) exitWith {};
waitUntil{!(isNull player)};

apr_mwnvg_script = {

//mwnvg colorset credit to Apricot_ale
apr_mwnvg_handle_mwace_effect = [1, 1, 0, [0, 0, 0, 0], [0, 0.95, 1, 0], [0.30, 0.59, 0.11, 0]];
apr_mwnvg_handle_mwstd_effect = [1, 1, 0, [0, 0, 0, 0], [0, 1, 0.75, 0], [0.30, 0.59, 0.11, 0]];
//white phosphor credit to Fat_Lurch
apr_mwnvg_handle_wpace_effect = [1, 1, 0, [0, 0, 0, 0], [0.4, 1.4, 2.4, 0], [0.30, 0.59, 0.11, 0];
apr_mwnvg_handle_wpstd_effect = [1, 1, 0, [0, 0, 0, 0], [0.25, 0.75, 0.8, 0], [0.30, 0.59, 0.11, 0];

_nodselect = false;
if (apr_mwnvg_var_acecheck) then {
	switch (apr_mwnvg_var_nodselect) do {
		case 0: {_aceeffect = 1; _nodeffect = 0; _nodselect = false;}
		case 1: {_nodeffect = 1; _nodselect = apr_mwnvg_handle_mwace_effect;}
		case 2: {_nodeffect = 1; _nodselect = apr_mwnvg_handle_wpace_effect;}
	};
} else {
	switch (apr_mwnvg_var_nodselect) do {
		case 0: {_nodeffect = 0; _nodeffect = 0; _nodselect = false;}
		case 1: {_nodeffect = 0; _nodeffect = 1; _nodselect = apr_mwnvg_handle_mwstd_effect;}
		case 2: {_nodeffect = 0; _nodeffect = 2; _nodselect = apr_mwnvg_handle_wpstd_effect;}
	};
};

["ColorCorrections", 1500, _nodselect] spawn
{
	params ["_name", "_priority", "_effect", "_handle"];
	
	while {
		_handle = ppEffectCreate [_name, _priority];
		_handle < 0
	} do {
		_priority = _priority + 1;
	};
	
	_handle ppEffectAdjust _effect;
	_handle ppEffectForceInNVG true;
	_handle ppEffectCommit 0.01;
	
	while {true} do {
		if (alive player) then {
			waitUntil {((currentVisionMode player) == 1) or !(apr_mwnvg_var_nodselect == _nodeffect)};
			if {!(apr_mwnvg_var_nodselect == _nodeffect)} then {exitWith {call apr_mwnvg_script; systemChat "effect changed";};};
			_handle ppEffectEnable true;
			waitUntil {ppEffectCommitted _handle};
			systemChat "effect is alive";
			waitUntil {(!((currentVisionMode player) == 1)) or (!alive player) or !(apr_mwnvg_var_nodselect == _nodeffect)};
			if {!(apr_mwnvg_var_nodselect == _nodeffect)} then {exitWith {call apr_mwnvg_script; systemChat "effect changed";};};
			_handle ppEffectEnable false;
			systemChat "effect remove";
			if (!alive player) exitWith {ppEffectDestroy _handle;};
		};
	};
};
};

[apr_mwnvg_script]
