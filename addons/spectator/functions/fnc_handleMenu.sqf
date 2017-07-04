/*
 * Author: Kingsley
 * Handles the menu buttons.
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Button <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_spectator_fnc_handleMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_control", "_button"];

switch (_button) do {
    case 2: { // Tags
        INC(GVAR(camTagsButton));

        if (GVAR(camTagsButton) > 6) then {GVAR(camTagsButton) = 0};
        _control ctrlSetText (GVAR(camTagsNames) select GVAR(camTagsButton));

        if (GVAR(camTagsButton) > 0) then {
            GVAR(camToggleTags) = true;
        } else {
            GVAR(camToggleTags) = false;
        };
    };

    case 3: { // Third/First Person Button
        GVAR(camToggleCamera) = !GVAR(camToggleCamera);

        if (GVAR(camToggleCamera)) then {
            GVAR(camMode) = 1;
            GVAR(camCamera) cameraEffect ["terminate", "BACK"];
            GVAR(camCurrentTarget) switchCamera "internal";
            _control ctrlSetText "VIEW (THIRD PERSON)";
        } else {
            GVAR(camMode) = 0;
            GVAR(camCamera) cameraEffect ["internal", "BACK"];
            _control ctrlSetText "VIEW (FIRST PERSON)";
        };
    };

    case 4: { // Rejoin mission Button
        if (SANDBOX_MODE) then {
            [{
                params ["_unit"];
                _unit setPos (call EFUNC(sandbox,getSpawnPos));
            }] call FUNC(exit);
        } else {
            player setVariable [QGVAR(rejoin), true, true];
            hint "Waiting for admin to trigger reinforcement wave.";
        };
    };

    case 5: { // 3D Tracers
        // TODO
        if (true) exitWith {};

        INC(GVAR(camTracersButton));

        if (GVAR(camTracersButton) > 3) then {GVAR(camTracersButton) = 0};
        _control ctrlSetText (GVAR(camTracersNames) select GVAR(camTracersButton));

        {[_x] call CBA_removeUnitTrackProjectiles;false} count allUnits;

        switch (GVAR(camTracersButton)) do {
            case 0: { // Off
                {[_x] call CBA_removeUnitTrackProjectiles;false} count allUnits;
            };
            case 1: { // Players
                {[_x] call CBA_fnc_addUnitTrackProjectiles;false} count allPlayers;
            };
            case 2: { // AI
                {[_x] call CBA_fnc_addUnitTrackProjectiles;false} count (allUnits - allPlayers);
            };
            case 3: { // Both
                {[_x] call CBA_fnc_addUnitTrackProjectiles;false} count allUnits;
            };
        };
    };

    case 6: {
        GVAR(camUnitListShow) = !GVAR(camUnitListShow);

        if (GVAR(camUnitListShow)) then {
            _control ctrlSetText "«";

            _control ctrlSetPosition [
                (0.15 * safeZoneW + safeZoneX),
                (0.041 * safeZoneH + safeZoneY),
                (0.02 * safeZoneW),
                (0.03 * safeZoneH)
            ];

            _control ctrlCommit 0.15;

            ((findDisplay IDC_DIALOG) displayCtrl IDC_UNITBOX) ctrlSetPosition [
                (0 * safeZoneW + safeZoneX),
                (0.03 * safeZoneH + safeZoneY),
                (0.15 * safeZoneW),
                (0.97 * safeZoneH)
            ];

            ((findDisplay IDC_DIALOG) displayCtrl IDC_UNITBOX) ctrlCommit 0.15;
        } else {
            _control ctrlSetText "»";
            _control ctrlSetPosition [
                (0 * safeZoneW + safeZoneX),
                (0.041 * safeZoneH + safeZoneY),
                (0.02 * safeZoneW),
                (0.03 * safeZoneH)
            ];

            _control ctrlCommit 0.15;

            ((findDisplay IDC_DIALOG) displayCtrl IDC_UNITBOX) ctrlSetPosition [
                ((0 * safeZoneW + safeZoneX) - (0.15 * safeZoneW)),
                (0.03 * safeZoneH + safeZoneY),
                (0.15 * safeZoneW),
                (0.97 * safeZoneH)
            ];

            ((findDisplay IDC_DIALOG) displayCtrl IDC_UNITBOX) ctrlCommit 0.15;
        };
    };
};
