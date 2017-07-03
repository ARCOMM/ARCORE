/*
 * Author: Kingsley
 * Sets the group name.
 *
 * Arguments:
 * Console arguments.
 *
 * Return Value:
 * Void
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_name"];

private _group = group ace_player;

if (ace_player != leader _group) exitWith {
    systemChat "You need to be the group leader to do that!";
};

_group setGroupIdGlobal [_name, "GroupColor0"];
_group setVariable [QGVAR(text), _name, true];
_group setVariable [QGVAR(enabled), true, true];
