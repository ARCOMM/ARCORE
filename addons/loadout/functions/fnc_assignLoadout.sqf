/*
 * Author: Kingsley
 * Assigns the given loadout to the given unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Role <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "co"] call arcore_loadout_fnc_assignLoadout;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_role", "", [""]]
];

if (isNull _unit) exitWith {};
if (_role == "") exitWith {};

if (!local _unit) exitWith {
    _this remoteExecCall [QFUNC(assignLoadout), _unit];
};

// Community Factions Project compatibility
// Disable Randomisation
if (isClass (configfile >> "CfgPatches" >> "cfp_main")) then {_unit setVariable ["CFP_DisableRandom", true, true]};
//

private _content = "";

if (_role find ":" != -1) then {
    private _parts = _role splitString ":";
    _parts params ["_dir", "_file"];
    private _script = format ["loadouts\%1\%2.sqf", _dir, _file];
    _content = preprocessFileLineNumbers _script;
} else {
    private _faction = [_unit] call CFUNC(getFaction);
    private _script = format ["loadouts\%1\%2.sqf", _faction, _role];
    _content = preprocessFileLineNumbers _script;
};

private _callable = [
    "this = _this;",
    "removeAllWeapons this;",
    "removeAllItems this;",
    "removeAllAssignedItems this;",
    "removeUniform this;",
    "removeVest this;",
    "removeBackpack this;",
    "removeHeadgear this;",
    "removeGoggles this;",
    _content
];

_unit call compile (_callable joinString "");

_unit setVariable [QGVAR(loadout), _role, true];
_unit setVariable [QGVAR(done), true, true];
