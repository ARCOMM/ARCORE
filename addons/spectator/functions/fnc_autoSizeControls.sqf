/*
 * Author: Kingsley
 * Auto-sizes the menu bar controls.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_spectator_fnc_autoSizeControls;
 *
 * Public: No
 */

#include "script_component.hpp"

disableSerialization;

GVAR(camMenuButtonX) = 0 * safeZoneW + safeZoneX;

{
    ((findDisplay IDC_DIALOG) displayCtrl _x) ctrlSetPosition [
        GVAR(camMenuButtonX),
        (0 * safeZoneH + safeZoneY),
        GVAR(camMenuButtonWidth),
        (0.03 * safeZoneH)
    ];

    ((findDisplay IDC_DIALOG) displayCtrl _x) ctrlCommit 0;
    GVAR(camMenuButtonX) = GVAR(camMenuButtonX) + GVAR(camMenuButtonWidth);
} forEach GVAR(camMenuControls);
