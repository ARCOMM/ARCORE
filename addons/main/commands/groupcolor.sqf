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

if (ace_player != leader group ace_player) exitWith {
    systemChat "You need to be the group leader to do that!";
};

group ace_player setVariable ["ARC_groupColour", format ["Color%1", _color], true];
group ace_player setVariable ["ARC_groupHandled", true, true];
