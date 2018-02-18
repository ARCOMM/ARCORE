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
_group setVariable [QEGVAR(spectator,virtual), false, true];

private _sideName = switch (side ace_player) do {
    case west: {QGVAR(ShowBLUFOR)};
    case east: {QGVAR(ShowOPFOR)};
    case resistance: {QGVAR(ShowINDFOR)};
    case civilian: {QGVAR(ShowCIV)};
    default {""};
};

if (_sideName != "") then {
    _group setVariable [_sideName, true, true];
};
