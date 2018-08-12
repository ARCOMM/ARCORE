/*
 * Author: Kingsley
 * Checks whether the given player is an admin (either logged into server admin or a verified Steam ID)
 *
 * Arguments:
 * 0: Player to check <OBJECT>
 *
 * Return Value:
 * Is admin <BOOL>
 *
 * Example:
 * _isAdmin = [player] call arcore_admin_fnc_isAdmin;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_strict", false, [false]]
];

if (isNull _unit) exitWith {false};

if (!_strict) then {
    private _curators = [];

    {
        _curators pushBackUnique (getAssignedCuratorUnit _x);
        false
    } count allCurators;

    if (_unit in _curators) exitWith {true};
};

private _adminList = [
    "76561198073677701", // Krijger
    "76561198115517788", // Kingsley
    "76561197985318459", // WirelessPillow
    "76561198070330109" // HazardousChurch
];

if (serverCommandAvailable "#logout" || isServer) exitWith {true};
if ((getPlayerUID _unit) in _adminList) exitWith {true};

false
