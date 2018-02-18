/*
 * Author: Kingsley
 * Gets the group by the given name.
 *
 * Arguments:
 * 0: Name <STRING>
 *
 * Return Value:
 * Group <GROUP>
 *
 * Example:
 * ["A1"] call arcore_common_fnc_getGroupByName;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_name", "", [""]],
    ["_side", sideUnknown, [sideUnknown]]
];

if (_name isEqualTo "") exitWith {grpNull};

((allGroups select {
    private _id = _x getVariable [QEGVAR(group,text), groupId _x];
    private _matches = toLower _id == toLower _name;

    if !(_side isEqualTo sideUnknown) then {
        (_matches && side _x == _side)
    } else {
        (_matches)
    };
}) param [0, grpNull]);
