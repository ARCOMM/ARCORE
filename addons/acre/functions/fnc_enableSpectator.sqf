/*
 * Author: Kingsley
 * Enables the ACRE spectator mode.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_acre_fnc_enableSpectator;
 *
 * Public: Yes
 */

#include "script_component.hpp"

[true] call acre_api_fnc_setSpectator;
