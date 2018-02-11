/*
 * Author: Kingsley
 * Handles the locality change of an AI unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Is it local here? <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, true] call arcore_ai_fnc_handleLocality;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_local"];

if (!_local) exitWith {};

private _commands = _unit getVariable [QGVAR(localCommands), []];

{ _unit call _x; } forEach _commands;
