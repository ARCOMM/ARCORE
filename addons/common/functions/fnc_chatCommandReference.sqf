/*
 * Author: Kingsley
 * Hooks into the chat UI to display a chat command reference.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_common_fnc_chatCommandReference;
 *
 * Public: No
 */

#include "script_component.hpp"

#define COMMAND_REF_IDC 456987123

ctrlDelete (findDisplay 46 displayCtrl COMMAND_REF_IDC);

["KeyDown", {
    params ["_display", "_code"];

    if (_code == (actionKeys "chat" param [0, 53])) exitWith {
        if (GVAR(commandReferenceControl)) exitWith {};

        private _control = _display ctrlCreate ["RscStructuredText", COMMAND_REF_IDC];
        _control ctrlSetPosition [safeZoneX + (safeZoneW * 0.8), safeZoneY, (safeZoneW * 0.2), safeZoneH];
        _control ctrlSetStructuredText (call FUNC(getChatCommandReferenceText));
        _control ctrlSetBackgroundColor [0,0,0,0.1];
        _control ctrlCommit 0;
        GVAR(commandReferenceControl) = true;
    };

    if (_code in [28, 156]) exitWith {
        ctrlDelete (_display displayCtrl COMMAND_REF_IDC);
        GVAR(commandReferenceControl) = false;
    };
}] call CBA_fnc_addDisplayHandler;
