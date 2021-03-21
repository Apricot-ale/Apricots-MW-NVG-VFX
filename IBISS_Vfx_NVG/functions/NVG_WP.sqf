if (isDedicated) exitWith {};
if (isServer && (not hasInterface)) exitWith {};
waitUntil{!(isNull player)};

_IBISS_Vfx_NVG_Handle_WP = ppEffectCreate ["colorCorrections", 1503];
_IBISS_Vfx_NVG_Handle_WP ppEffectAdjust [1, 0.6, 0, [0, 0.1, 0.2, 0], [0.4, 1.4, 2.4, 0], [1, 1, 1, 0]];
_IBISS_Vfx_NVG_Handle_WP ppEffectForceInNVG true;  
_IBISS_Vfx_NVG_Handle_WP ppEffectCommit 0; 

while {true} do 
{
	if (((currentVisionMode player) == 1) && (IBISS_Vfx_NVG_Setting == 3)) then
	{
		_IBISS_Vfx_NVG_Handle_WP ppEffectEnable true; 
	}
	else
	{
		_IBISS_Vfx_NVG_Handle_WP ppEffectEnable false; 
	};
	sleep 0.02;
};

_IBISS_Vfx_NVG_Handle_WP ppEffectEnable false;
ppEffectDestroy _IBISS_Vfx_NVG_Handle_WP;
_IBISS_Vfx_NVG_Handle_WP = nil;