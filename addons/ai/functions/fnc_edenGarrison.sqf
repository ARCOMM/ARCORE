/*
 * Author: Kingsley
 * Handles the Eden garrison attribute.
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: State <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [grp, true] call arcore_ai_fnc_edenGarrison;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_group", "_enabled"];

if (_enabled) then {
    [leader _group, nil, _group] call FUNC(garrison);
};
