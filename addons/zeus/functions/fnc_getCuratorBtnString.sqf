/*
 * Author: Kingsley
 * Returns the login button string
 *
 * Arguments:
 * None
 *
 * Return Value:
 * String <STRING>
 *
 * Example:
 * [] call arcore_zeus_fnc_getCuratorBtnString;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_slot", 1, [1]]];

private _moduleName = format ["%1%2", QGVAR(zeusModule), _slot];
private _module = missionNamespace getVariable [_moduleName, objNull];
private _output = "Disabled";

if (!isNil _moduleName) then {
    _curator = getAssignedCuratorUnit _module;

    if (isNull _curator) then {
        _output = "Login";
    } else {
        if (_curator == player) then {
            _output = "Logout";
        } else {
            _output = "Login";
        };
    };
} else {
    _output = "Login";
};

_output
