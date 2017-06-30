/*
 * Author: Kingsley
 * Resets the given unit's position to the nearest safe location.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Void
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {};
if (vehicle _unit != _unit) exitWith {};

private _safePos = (getPosATL _unit) findEmptyPosition [0, 25, (typeOf _unit)];

if (count _safePos == 3) exitWith {
    _safePos set [2, 0];
    _unit setPosATL _safePos;
};
