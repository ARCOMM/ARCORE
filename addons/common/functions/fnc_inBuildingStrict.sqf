/*
 * Author: Kingsley
 * Check if the unit is in a building.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is the unit in a building? <BOOL>
 *
 * Example:
 * [player] call arcore_common_fnc_inBuildingStrict;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if (_unit isEqualTo objNull) exitWith {};

private _pos = getPosASL _unit;
private _intersections = lineIntersectsSurfaces [
    _pos vectorAdd [0, 0, 1],
    _pos vectorAdd [0, 0, -20],
    _unit
];

private _object = (_intersections param [0, []]) param [2, objNull];

if (isNull _object) exitWith {false};

(_object isKindOf "Building")
