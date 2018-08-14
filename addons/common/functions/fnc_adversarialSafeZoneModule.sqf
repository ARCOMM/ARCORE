/*
 * Author: Kingsley
 * Stores the safe zone area for every machine.
 *
 * Arguments:
 * 0: Module <LOGIC>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_module] call arcore_common_fnc_adversarialSafeZoneModule;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic"];

private _area = _logic getVariable ["objectArea", [0, 0, 0, false, 0]];
private _locationArray = [_logic];
_locationArray append _area;

GVAR(adversarialSafeZones) pushBack _locationArray;
publicVariable QGVAR(adversarialSafeZones);
