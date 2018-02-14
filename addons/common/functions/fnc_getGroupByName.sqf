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

params [["_name", "", [""]]];

if (_name isEqualTo "") exitWith {grpNull};

((allGroups select {
    toLower (groupId _x) == toLower _name
}) param [0, grpNull]);
