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
private ["_pos", "_missionPos", "_configPos"];

_missionPos = ["CfgARCMF", "General", "respawnPosition"] call BIS_fnc_getCfgData;
_configPos = (configFile >> "CfgSandbox" >> worldName >> "startingPosition") call BIS_fnc_getCfgData;

if (!isNil "_missionPos") then {
  _pos = _missionPos;
} else {
  _pos = _configPos;
};

if (_rand) exitWith {
    ([_pos, 10] call CBA_fnc_randPos)
};

_pos
