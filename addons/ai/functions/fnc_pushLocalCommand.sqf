/*
 * Author: Kingsley
 * Pushes a command to the given unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Command <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, {}] call arcore_ai_fnc_pushLocalCommand;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_command", {}, [{}]]];

private _commands = _unit getVariable [QGVAR(localCommands), []];

_commands pushBack _command;

_unit setVariable [QGVAR(localCommands), _commands, true];
