/*
 * Author: Kingsley
 * Computes the camera position and orientation.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_spectator_fnc_computeCamera;
 *
 * Public: No
 */

#include "script_component.hpp"

private _x = GVAR(camMouseCord) select 0;
private _y = GVAR(camMouseCord) select 1;
private _leftButton = GVAR(camMouseButton) select 0;
private _rightButton = GVAR(camMouseButton) select 1;
GVAR(camMouseDeltaX) = GVAR(camMouseLastX) - (_x);
GVAR(camMouseDeltaY) = GVAR(camMouseLastY) - (_y);

if (_rightButton && !_leftButton) then {
    GVAR(camAngleX) = (GVAR(camAngleX) - (GVAR(camMouseDeltaX) * 360));
    GVAR(camAngleY) = (GVAR(camAngleY) + (GVAR(camMouseDeltaY) * 180)) min 89 max -89;
};

if (GVAR(camCtrlDown) && _rightButton && _leftButton) then {
    GVAR(camFovZoom) = 0.7;
};

GVAR(camMouseLastX) = (GVAR(camMouseCord) select 0);
GVAR(camMouseLastY) = (GVAR(camMouseCord) select 1);
