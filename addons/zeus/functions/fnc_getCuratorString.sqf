/*
 * Author: Kingsley
 * Returns the login string
 *
 * Arguments:
 * None
 *
 * Return Value:
 * String <STRING>
 *
 * Example:
 * [] call arcore_zeus_fnc_getCuratorString;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_slot", 1, [1]]];

private _moduleName = format ["%1%2", QGVAR(zeusModule), _slot];
private _module = missionNamespace getVariable [_moduleName, objNull];
private _output = "Curator: Unavailable";

if (!isNil _moduleName) then {
    private _curator = getAssignedCuratorUnit _module;

    if (isNull _curator) then {
        _output = "Curator: Available";
    } else {
        _output = format ["Curator: %1", name _curator];
    };
} else {
    _output = "Curator: Unavailable";
};

_output
