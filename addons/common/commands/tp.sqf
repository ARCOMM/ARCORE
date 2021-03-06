/*
 * Author: Kingsley
 * Teleports the player to the given group/player.
 */

#include "script_component.hpp"

params ["_name"];

private _unit = [_name] call FUNC(getPlayerByName);

if (isNull _unit) then {
    _unit = leader ([_name, side ace_player] call FUNC(getGroupByName));
};

if (!isNull _unit) then {
    if (vehicle _unit != _unit) then {
        ace_player moveInAny vehicle _unit;

        if !(ace_player in vehicle _unit) then {
            systemChat format ["%1's vehicle is full", name _unit];
            [format ["%1 tried to teleport to %2's vehicle", name ace_player, name _unit], true] call CFUNC(systemChatAdmin);
        } else {
            [format ["%1 teleported to %2's vehicle", name ace_player, name _unit], true] call CFUNC(systemChatAdmin);
        };
    } else {
        private _pos = _unit getRelPos [3, 180];
        ace_player setDir (getDir _unit);
        ace_player setPos _pos;
        [format ["%1 teleported to %2", name ace_player, name _unit], true] call CFUNC(systemChatAdmin);
    };
};
