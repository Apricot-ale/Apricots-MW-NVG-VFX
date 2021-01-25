if (isDedicated) exitWith {};
if (isServer && (not hasInterface)) exitWith {};
waitUntil{!(isNull player)};

_IBISS_Vfx_NVG_Handle_MW = ppEffectCreate ["colorCorrections", 1502];
_IBISS_Vfx_NVG_Handle_MW ppEffectAdjust [1, 0.6, 0, [0, 0.1, 0.2, 0], [0, 1, 1.2, 0], [1, 1, 1, 0]];
_IBISS_Vfx_NVG_Handle_MW ppEffectForceInNVG true;  
_IBISS_Vfx_NVG_Handle_MW ppEffectCommit 0; 

while {true} do 
{
	if (((currentVisionMode player) == 1) && (IBISS_Vfx_NVG_Setting == 2)) then
	{
		_IBISS_Vfx_NVG_Handle_MW ppEffectEnable true; 
	}
	else
	{
		_IBISS_Vfx_NVG_Handle_MW ppEffectEnable false; 
	};
	sleep 0.02;
};

_IBISS_Vfx_NVG_Handle_MW ppEffectEnable false;
ppEffectDestroy _IBISS_Vfx_NVG_Handle_MW;
_IBISS_Vfx_NVG_Handle_MW = nil;