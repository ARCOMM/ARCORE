/*
 * Author: Kingsley
 * Returns true or false whether Zeus is available
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Available <BOOL>
 *
 * Example:
 * [] call arcore_zeus_fnc_isAvailable;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_slot", 1, [1]]];

private _moduleName = format ["%1%2", QGVAR(zeusModule), _slot];
private _module = missionNamespace getVariable [_moduleName, objNull];
private _available = false;

private _currentZeus = getAssignedCuratorLogic player;
if (!isNull _currentZeus && _currentZeus != _module) exitWith {
    false
};

if (!isNil _moduleName) then {
    _curator = getAssignedCuratorUnit _module;

    if (isNull _curator) then {
        _available = true;
    } else {
        if (_curator == player) then {
            _available = true;
        } else {
            _available = false;
        };
    };
} else {
    _available = false;
};

_available
