/*
 * Author: Kingsley
 * Starts the briefing stage
 *
 * Arguments:
 * 0: Timer in minutes <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [5] call arcore_briefing_fnc_startBriefingStage;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_timer", 0, [0]]];

// Remove any existing per-frame handler
if (!isNil QGVAR(briefingTimerPFH)) then {
    [GVAR(briefingTimerPFH)] call CBA_fnc_removePerFrameHandler;
};

// Broadcast local handle
GVAR(briefingEnded) = false;
publicVariable QGVAR(briefingEnded);

// Turn safety on for all players
{[_x, true] remoteExecCall [QCFUNC(setSafety), _x]} forEach allPlayers;

GVAR(briefingTimerPFH) = [{
    params ["_args", "_handler"];
    _args params ["_timer"];

    private _currentTime = round (time / 60);

    if (_currentTime == 0) exitWith {
        if (_timer > 0) then {
            format ["Weapons are cold, briefing stage will end in %1 minute%2", _timer, ["","s"] select (_timer > 1)] remoteExecCall ["hintSilent", 0];
        } else {
            "Weapons are cold, waiting for admin to trigger start" remoteExecCall ["hintSilent", 0];
        };
    };

    if (_currentTime >= _timer && {_timer > 0}) then {
        [_handler] call CBA_fnc_removePerFrameHandler;
        [] call FUNC(endBriefingStage);
    } else {
        format ["%1 minute%2 since briefing stage started", _currentTime, ["","s"] select (_currentTime > 1)] remoteExecCall ["hintSilent", 0];
    };
}, 60, [_timer]] call CBA_fnc_addPerFrameHandler;

GVAR(briefingStageWatcher) = [{
    params ["_args", "_handler"];

    if (GVAR(briefingEnded)) exitWith {
        [_handler] call CBA_fnc_removePerFrameHandler;
        [] call FUNC(endBriefingStage);
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
