/*
 * Author: Kingsley
 * Handles the safe start chat command.
 *
 * Arguments:
 * Console arguments.
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_state"];

_state = toLower _state;

if (_state == "on") exitWith {
    [0] remoteExecCall [QFUNC(startBriefingStage), 2];
};

if (_state == "off") exitWith {
    [] remoteExecCall [QFUNC(endBriefingStage), 2];
};
