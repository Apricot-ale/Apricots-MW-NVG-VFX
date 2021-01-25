params ["_unit"];
systemChat "nvgvfx.sqf is loading";
if (!hasInterface) exitWith {};
if (!isPlayer _unit) exitWith {};
waitUntil{!(isNull player)};
systemChat "nvgvfx.sqf is runnning";

apr_mwnvg_handle_mwace_vfx = [1, 1, 0, [0, 0, 0, 0], [0, 0.95, 1, 0], [0.30, 0.59, 0.11, 0]];
apr_mwnvg_handle_mwstd_vfx = [1, 1, 0, [0, 0, 0, 0], [0, 1, 0.75, 0], [0.30, 0.59, 0.11, 0]];
apr_mwnvg_handle_wpace_vfx = [1, 1, 0, [0, 0, 0, 0], [0.4, 1.4, 2.4, 0], [0.30, 0.59, 0.11, 0]];
apr_mwnvg_handle_wpstd_vfx = [1, 1, 0, [0, 0, 0, 0], [0.25, 0.75, 0.8, 0], [0.30, 0.59, 0.11, 0]];

apr_mwnvg_fnc_effect = {
	params ["_vfxeffect", "_vfxselect", "_acecheck"];
	systemChat "apr_mwnvg_fnc_effect is called";
	["ColorCorrections", 1500, _vfxeffect, _vfxselect, _acecheck] spawn {
		params ["_name", "_priority", "_vfxeffect", "_vfxselect", "_acecheck"];
		private ["_handle", "_isalive"];
		while {
			_handle = ppEffectCreate [_name, _priority];
			_handle < 0
		} do {
			_priority = _priority + 1;
		};
		_handle ppEffectAdjust _vfxeffect;
		_handle ppEffectForceInNVG true;
		_handle ppEffectCommit 0.01;
		_isalive = true;
		player addEventHandler ["Killed", {_isalive = false;}];
		while {
			(_isalive == true) &&
			(_vfxselect == apr_mwnvg_var_vfxselect) &&
			(_acecheck == apr_mwnvg_var_acecheck)
		} do {
			waitUntil {((currentVisionMode player) == 1) || (_vfxselect != apr_mwnvg_var_vfxselect) || (_acecheck != apr_mwnvg_var_acecheck) || (_isalive != true)};
			_handle ppEffectEnable true;
			waitUntil {ppEffectCommitted _handle};
			systemChat "effect is alive";
			waitUntil {((currentVisionMode player) != 1) || (_vfxselect != apr_mwnvg_var_vfxselect) || (_acecheck != apr_mwnvg_var_acecheck) || (_isalive != true)};
			_handle ppEffectEnable false;
			systemChat "effect remove";
		};
		ppEffectDestroy _handle;
		call apr_mwnvg_fnc_select;
	};
};

apr_mwnvg_fnc_select = {
	private ["_vfxeffect", "_vfxselect", "_acecheck"];
	systemChat "apr_mwnvg_fnc_select is started";
	_vfxeffect = 0;
	_vfxselect = apr_mwnvg_var_vfxselect;
	_acecheck = apr_mwnvg_var_acecheck;	
	if (!alive player) then {
		switch (apr_mwnvg_var_vfxselect) do {
			case 0: {};
			case 1: {_vfxeffect = apr_mwnvg_handle_mwstd_vfx};
			case 2: {_vfxeffect = apr_mwnvg_handle_wpstd_vfx};
		};
	} else {
		if (apr_mwnvg_var_acecheck) then {
			switch (apr_mwnvg_var_vfxselect) do {
				case 0: {};
				case 1: {_vfxeffect = apr_mwnvg_handle_mwace_vfx};
				case 2: {_vfxeffect = apr_mwnvg_handle_wpace_vfx};
			};
		} else {
			switch (apr_mwnvg_var_vfxselect) do {
				case 0: {};
				case 1: {_vfxeffect = apr_mwnvg_handle_mwstd_vfx};
				case 2: {_vfxeffect = apr_mwnvg_handle_wpstd_vfx};
			};
		};
	};	
	if (_vfxselect == 0) then {
		waitUntil {
			(_vfxselect != apr_mwnvg_var_vfxselect) || 
			(_acecheck != apr_mwnvg_var_acecheck)
		};
		call apr_mwnvg_fnc_select;
	} else {
		[_vfxeffect, _vfxselect, _acecheck] call apr_mwnvg_fnc_effect;
	};
};

call apr_mwnvg_fnc_select;