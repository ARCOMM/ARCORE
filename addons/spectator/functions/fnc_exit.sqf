/*
 * Author: Kingsley
 * Closes the entire spectator interface.
 *
 * Arguments:
 * 0: Code to call afterwards (optional) <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [{params ["_unit", "_args"]}] call arcore_spectator_fnc_exit;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_code", {}, [{}]], ["_args", []]];

GVAR(forceExit) = true;

// Chat
// TODO
setCurrentChannel 1;

closeDialog 1;

[GVAR(pfhCamera)] call CBA_fnc_removePerFrameHandler;
[GVAR(pfhTags)] call CBA_fnc_removePerFrameHandler;

{
    _x cameraEffect ["terminate", "back"];
    camDestroy _x;
} forEach [GVAR(camCamera), cameraOn, GVAR(camFreeCamera), GVAR(camFakeCamera)];

GVAR(isSpectating) = false;

group player setVariable [QGVAR(virtual), false, true];
player setVariable [QGVAR(virtual), false, true];
player setVariable [QGVAR(rejoin), false, true];

// Post Processing
if (!isNil "BIS_fnc_feedback_allowPP") then {
    BIS_fnc_feedback_allowPP = true;
};

// ACRE
if (!isNil "acre_api_fnc_setSpectator") then {
    [false] call acre_api_fnc_setSpectator;
};

player allowDamage true;
player enableSimulation true;

[player, _args] call _code;
