/*
 * Author: Kingsley
 * Gets the player object by their name.
 * Player name's must be longer than 3 chars.
 *
 * Arguments:
 * 0: Name <STRING>
 *
 * Return Value:
 * Object | null
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_name", "", [""]]];

if (_name isEqualTo "" || {count _name <= 3}) exitWith {objNull};

((([] call CBA_fnc_players) select {
    ([_name, name _x, false] call BIS_fnc_inString)
}) param [0, objNull]);
