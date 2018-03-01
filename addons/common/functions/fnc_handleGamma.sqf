/*
 * Author: Kingsley
 * Handles the changing of gamma.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_common_fnc_handleGamma;
 *
 * Public: No
 */

#include "script_component.hpp"

[{!isNull findDisplay 5}, {
    private _control = ((findDisplay 5) displayCtrl 2302) controlsGroupCtrl 110;

    GVAR(gammaStart) = sliderPosition _control;

    _control ctrlAddEventHandler ["SliderPosChanged", {
        params ["_control", "_change"];
        GVAR(gammaEnd) = sliderPosition _control;
    }];

    [{isNull findDisplay 5}, {
        if (GVAR(gammaEnd) != GVAR(gammaStart)) then {
            [format [
                "%1 changed gamma: %2 -> %3",
                name ace_player,
                GVAR(gammaStart) toFixed 2,
                GVAR(gammaEnd) toFixed 2
            ], true] call FUNC(systemChatAdmin);
        };

        call FUNC(handleGamma);
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_waitUntilAndExecute;
