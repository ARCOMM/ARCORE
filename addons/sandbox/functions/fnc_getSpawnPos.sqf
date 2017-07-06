/*
 * Author: Kingsley
 * Gets the spawn position.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Position <ARRAY>
 *
 * Example:
 * [] call arcore_sandbox_fnc_getSpawnPos;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_rand", false, [false]]];

private _pos = getArray (configFile >> "CfgSandbox" >> worldName >> "startingPosition");

if (_rand) exitWith {
    ([_pos, 10] call CBA_fnc_randPos)
};

_pos
