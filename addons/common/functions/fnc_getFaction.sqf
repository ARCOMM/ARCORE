/*
 * Author: Kingsley
 * Gets the faction name from the given side or unit
 *
 * Arguments:
 * 0: Unit or side <OBJECT, SIDE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call arcore_common_fnc_getFaction;
 * [west] call arcore_common_fnc_getFaction;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_side", player, [west, objNull]]];

if (_side isEqualType objNull) then {
    _side = side group _side;
};

switch (_side) do {
    case west: {"blufor"};
    case east: {"opfor"};
    case resistance: {"indfor"};
    case civilian: {"civilian"};
    case sideLogic: {"game_master"};
    default {"unknown"};
};
