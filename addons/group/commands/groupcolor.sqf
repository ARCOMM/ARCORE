/*
 * Author: Kingsley
 * Sets the group marker color.
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

params ["_color"];

private _group = group ace_player;

if (ace_player != leader _group) exitWith {
    systemChat "You need to be the group leader to do that!";
};

_group setVariable [QGVAR(color), format ["Color%1", _color], true];
_group setVariable [QGVAR(enabled), true, true];
