/*
 * Author: Kingsley
 * Ends the briefing stage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_briefing_fnc_endBriefingStage;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (!isNil QGVAR(briefingTimerPFH)) then {
    [GVAR(briefingTimerPFH)] call CBA_fnc_removePerFrameHandler;
};

if (!isNil QGVAR(briefingStageWatcher)) then {
    [GVAR(briefingStageWatcher)] call CBA_fnc_removePerFrameHandler;
};

GVAR(timerEnd) = 5;

[{
    params ["_args", "_handler"];

    if (GVAR(timerEnd) <= 0) exitWith {
        "Weapons are live!" remoteExecCall ["hintSilent", 0];
        {[_x, false] remoteExecCall [QCFUNC(setSafety), _x]} forEach allPlayers;
        [_handler] call CBA_fnc_removePerFrameHandler;
        [QGVAR(ended)] call CBA_fnc_globalEvent;
        [QGVAR(endedJIP)] call CBA_fnc_globalEventJIP;
        [QGVAR(endedServer)] call CBA_fnc_serverEvent;
    };

    format [
        "Weapons are live in %1 second%2",
        GVAR(timerEnd),
        ["s",""] select (GVAR(timerEnd) == 1)
    ] remoteExecCall ["hintSilent", 0];

    GVAR(timerEnd) = GVAR(timerEnd) - 1;
}, 1, []] call CBA_fnc_addPerFrameHandler;
