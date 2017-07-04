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

private _startPos = [getArray (missionConfigFile >> "CfgSandbox" >> worldName >> "startingPosition"), 10] call CBA_fnc_randPos;

_startPos
