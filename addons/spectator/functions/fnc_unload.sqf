/*
 * Author: Kingsley
 * Handles the unload display event.
 * Will allow the user to use the main menu.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_spectator_fnc_unload;
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(forceExit)) exitWith {};

disableSerialization;

sleep 1;

createDialog QGVAR(Dialog);

private _displayDialog = (findDisplay IDC_DIALOG);

ctrlSetText [IDC_TAGSNAMEBUTTON, GVAR(camTagsNames) select GVAR(camTagsButton)];
ctrlSetText [IDC_TRACERSBUTTON, GVAR(camTracersNames) select GVAR(camTracersButton)];

GVAR(camMenuButtonX) = 0 * safeZoneW + safeZoneX;

{ // Auto-size controls
    ((findDisplay IDC_DIALOG) displayCtrl _x) ctrlSetPosition [
        GVAR(camMenuButtonX),
        (0 * safeZoneH + safeZoneY),
        GVAR(camMenuButtonWidth),
        (0.03 * safeZoneH)
    ];

    ((findDisplay IDC_DIALOG) displayCtrl _x) ctrlCommit 0;
    GVAR(camMenuButtonX) = GVAR(camMenuButtonX) + GVAR(camMenuButtonWidth);
} forEach GVAR(camMenuControls);

call FUNC(updateUnitList);
