/*
 * Author: Kingsley
 * Adds the given ACRE radio to the given units inventory
 * Must be executed where the given unit is local
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Radio classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ACRE_PRC343"] call arcore_acre_fnc_addRadio;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_classname", "", [""]]
];

if (!local _unit || {_classname == ""}) exitWith {};

if (_unit canAdd _classname) then {
    _unit addItem _classname;
    systemChat "Radio added";
} else {
    systemChat "Not enough room in your inventory to add that radio";
};
