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

if (ace_player != leader group ace_playerplayer) exitWith {
    systemChat "You need to be the group leader to do that!";
};

group ace_player setGroupId [_name, "GroupColor0"];
group ace_player setVariable ["ARC_groupHandled", true, true];
