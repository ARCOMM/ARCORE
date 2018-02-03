/*
 * Author: Kingsley
 * Controls the movement of the unit.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

[GVAR(stateMachine), {}, {
    // systemChat format ["Moving %1", time];
    DEBUG_TAG("Start Moving");

    TIMER_SET(moveTimestamp);

    private _waypoints = waypoints group _this;
    private _pos = waypointPosition (_waypoints select 1);

    _this setVariable [QGVAR(doingMove), true];

    _this setUnitPos "UP";

    _this disableAI "FSM";
    _this disableAI "TARGET";
    _this disableAI "AUTOTARGET";

    _this doWatch objNull;
    _this doTarget objNull;
    _this commandWatch objNull;
    _this commandTarget objNull;

    group _this move _pos;
}, {
    // systemChat format ["Stopping %1", time];
    DEBUG_TAG("Stop Moving");

    _this setVariable [QGVAR(doingMove), false];
    _this setUnitPos "UP";

    _this enableAI "FSM";
    _this enableAI "TARGET";
    _this enableAI "AUTOTARGET";

    TIMER_RESET(moveTimestamp);
}, "Moving"] call CBA_statemachine_fnc_addState;

// [GVAR(stateMachine), {
    
// }, {}, {}, "Stopping"] call CBA_statemachine_fnc_addState;

{
    [GVAR(stateMachine), _x, "Moving", {count (waypoints group _this) > 1}, {}] call CBA_statemachine_fnc_addTransition;
} forEach ["Initial", "IdleStance", "CombatStance"];

[GVAR(stateMachine), "Moving", "CombatStance", {
    // unitReady _this
    if (TIMER_GET(moveTimestamp) <= 3) exitWith {
        systemChat format ["Timer not met %1", TIMER_GET(moveTimestamp)];
        false
    };

    // private _pos = _this getVariable [QGVAR(movePos), []];
    // if (_pos isEqualTo []) exitWith {false};
    // ((_pos distance _this) <= 1)

    private _doingMove = _this getVariable [QGVAR(doingMove), false];
    (_doingMove && speed _this <= 0)
}, {}] call CBA_statemachine_fnc_addTransition;
