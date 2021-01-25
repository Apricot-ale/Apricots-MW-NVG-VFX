if (isDedicated) exitWith {};
if (isServer && (not hasInterface)) exitWith {};
waitUntil{!(isNull player)};

_IBISS_Vfx_NVG_Handle_HV = ppEffectCreate ["colorCorrections", 1501];
_IBISS_Vfx_NVG_Handle_HV ppEffectAdjust [1, 0.6, 0, [0, 0.1, 0.2, 0], [0, 1, 1, 0], [1, 1, 1, 0]];
_IBISS_Vfx_NVG_Handle_HV ppEffectForceInNVG true;  
_IBISS_Vfx_NVG_Handle_HV ppEffectCommit 0; 

while {true} do 
{
	if (((currentVisionMode player) == 1) && (IBISS_Vfx_NVG_Setting == 1)) then
	{
		_IBISS_Vfx_NVG_Handle_HV ppEffectEnable true; 
	}
	else
	{
		_IBISS_Vfx_NVG_Handle_HV ppEffectEnable false; 
	};
	sleep 0.02;
};

_IBISS_Vfx_NVG_Handle_HV ppEffectEnable false;
ppEffectDestroy _IBISS_Vfx_NVG_Handle_HV;
_IBISS_Vfx_NVG_Handle_HV = nil;