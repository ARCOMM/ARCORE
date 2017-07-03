/*
 * Author: Kingsley
 * Sets the given unit's team color based on their role
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call arcore_group_fnc_setTeamColor;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {};

private _role = _unit getVariable [QEGVAR(loadout,loadout), "r"];
private _team = switch (_role) do {
    case "co";
    case "dc";
    case "m";
    case "ftl": {"MAIN"};
    case "ar";
    case "aar": {"RED"};
    case "r";
    case "rat": {"BLUE"};
    default {"MAIN"};
};

_unit assignTeam _team;
