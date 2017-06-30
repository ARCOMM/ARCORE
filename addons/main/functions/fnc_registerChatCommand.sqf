/*
 * Author: Kingsley
 * Registers the given chat command.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Scope <STRING>
 *
 * Return Value:
 * Void
 *
 * Example:
 * ["groupname", "all"] call arcore_main_fnc_registerChatCommand;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_name", ["_scope", "all"]];

[
    _name,
    compile preprocessFileLineNumbers format [
        "\z\arcore\addons\main\commands\%1.sqf",
        _name
    ],
    _scope
] call CBA_fnc_registerChatCommand;
