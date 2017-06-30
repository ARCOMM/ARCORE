/*
 * Author: Kingsley
 * Adds the given ACRE radio.
 *
 * Arguments:
 * Console arguments.
 *
 * Return Value:
 * Void
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_type"];

[ace_player, _type] call FUNC(addRadio);
