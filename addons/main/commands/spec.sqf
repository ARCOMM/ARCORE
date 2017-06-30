/*
 * Author: Kingsley
 * Opens spectator interface.
 */

#include "script_component.hpp"

if (isNil "f_fnc_CamInit") exitWith {
    systemChat "Cannot use #spec in non-framework mission";
};

[ace_player, objNull, 1, 1, true] call f_fnc_CamInit;
