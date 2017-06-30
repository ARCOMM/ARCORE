/*
 * Author: Kingsley
 * Adds the given ACRE radio to the given player's inventory.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Radio <STRING>
 *
 * Return Value:
 * Void
 *
 * Example:
 * ["343"] call arcore_main_fnc_addRadio;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit", "_radio"];

private _radioClassname = "";

if (!local _unit) exitWith {};

switch (_radio) do {
    case ("152"): {_radioClassname = "ACRE_PRC152";};
    case ("148"): {_radioClassname = "ACRE_PRC148";};
    case ("343"): {_radioClassname = "ACRE_PRC343";};
    default {
        if (true) exitWith {
            systemChat "Only available radios are 343, 148 and 152.";
        };
    };
};

if (_unit canAdd _radioClassname) then {
    _unit addItem _radioClassname;
    systemChat "Radio added";

    [format [
        "%1 (%2) retrieved a %3 from the map.",
        name _unit,
        [_unit] call FUNC(getUnitType),
        _radioClassname
    ]] call FUNC(log);
} else {
    systemChat "Not enough room in your inventory to add that radio";
};
