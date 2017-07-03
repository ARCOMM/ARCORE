/*
 * Author: Kingsley
 * Registers the given chat command.
 *
 * Arguments:
 * 0: Addon <STRING>
 * 1: Name <STRING>
 * 2: Scope <STRING>
 *
 * Return Value:
 * Void
 *
 * Example:
 * ["group", "groupname", "all"] call arcore_common_fnc_registerChatCommand;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_addon", "_name", ["_scope", "all"]];

[
    _name,
    compile preprocessFileLineNumbers format [
        "\z\arcore\addons\%1\commands\%2.sqf",
        _addon,
        _name
    ],
    _scope
] call CBA_fnc_registerChatCommand;
