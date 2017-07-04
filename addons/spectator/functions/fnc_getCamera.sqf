/*
 * Author: Kingsley
 * Gets the current camera in use.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Camera <OBJECT>
 *
 * Example:
 * [] call arcore_spectator_fnc_getCamera;
 *
 * Public: No
 */

#include "script_component.hpp"

private _camera = [GVAR(camCamera), cameraOn, GVAR(camFreeCamera)] select GVAR(camMode);

_camera
