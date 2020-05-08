/*
 * Author: Kingsley
 * Adds the given ACRE radio.
 *
 * Arguments:
 * Console arguments.
 *
 * Return Value:
 * Void
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_type"];

private _classname = "";

switch (_type) do {
    case ("343"): {_classname = "ACRE_PRC343"};
    case ("148"): {_classname = "ACRE_PRC148"};
    case ("152"): {_classname = "ACRE_PRC152"};
    case ("117"): {_classname = "ACRE_PRC117F"};
    case ("77"): {_classname = "ACRE_PRC77"};
    default {
        if (true) exitWith {
            systemChat "Available radios are 343, 148, 152, 117F and 77.";
        };
    };
};

[ace_player, _classname] call FUNC(addRadio);
[format ["%1 retrieved %2 radio from chat", name ace_player, _type], true] call CFUNC(systemChatAdmin);
