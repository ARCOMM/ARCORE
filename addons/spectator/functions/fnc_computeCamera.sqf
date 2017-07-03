/*
 * Author: Kingsley
 *
 *
 * Arguments:
 *
 *
 * Return Value:
 *
 *
 * Example:
 * [] call arcore_spectator_fnc_computeCamera;
 *
 * Public:
 */

#include "script_component.hpp"

private _x = GVAR(camMouseCord) select 0;
private _y = GVAR(camMouseCord) select 1;
private _leftButton = GVAR(camMouseButton) select 0;
private _rightButton = GVAR(camMouseButton) select 1;
GVAR(camMouseDeltaX) = f_cam_mouseLastX - (_x);
GVAR(camMouseDeltaY) = f_cam_mouseLastY - (_y);

if (_rightButton && !_leftButton) then {
    GVAR(camAngleX) = (GVAR(camAngleX) - (GVAR(camMouseDeltaX)*360));
    GVAR(camAngleY) = (GVAR(camAngleY) + (GVAR(camMouseDeltaY)*180)) min 89 max -89;
};

if (GVAR(camCtrlDown) && _rightButton && _leftButton) then {
    f_cam_fovZoom = 0.7;
};

f_cam_mouseLastX = (GVAR(camMouseCord) select 0);
f_cam_mouseLastY = (GVAR(camMouseCord) select 1);

