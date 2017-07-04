/*
 * Author: Kingsley
 * Toggles the interface visibility.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_spectator_fnc_toggleInterface;
 *
 * Public: No
 */

#include "script_component.hpp"

private _forbiddenControls = [IDC_MOUSEHANDLER];

{
    if !(_x in _forbiddenControls) then {
        ctrlShow [_x, !GVAR(camHideUi)];
    };
} forEach GVAR(camAllControls);
