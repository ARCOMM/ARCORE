/*
 * Author: Kingsley
 * Disables the ACRE spectator mode.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_acre_fnc_disableSpectator;
 *
 * Public: Yes
 */

#include "script_component.hpp"

[false] call acre_api_fnc_setSpectator;
