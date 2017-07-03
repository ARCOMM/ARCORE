/*
 * Author: Kingsley
 * Opens the spectator interface.
 *
 * Arguments:
 * Respawn event arguments.
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_spectator_fnc_init;
 *
 * Public: No
 */

#include "script_component.hpp"

_this spawn {
    params [
        ["_unit", objNull],
        ["_oldUnit", objNull],
        ["_respawn", 1],
        ["_respawnDelay", 3],
        ["_forced", false]
    ];

    GVAR(isSpectating) = true;

    createDialog QGVAR(Dialog);
};
