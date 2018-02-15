/*
 * Author: Kingsley
 * Controls the stance of the unit.
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

[GVAR(stateMachine), {
    DEBUG_TAG("Combat stance");

    // Don't overide explicitly set stance
    private _hasStance = _this getVariable [QGVAR(hasStance), false];
    if (!_hasStance && toLower (unitPos _this) != "auto") exitWith {
        DEBUG_TAG("Skip stance");
    };

    if (speed _this > 0) exitWith {};

    private _timestamp = _this getVariable [QGVAR(stanceTimestamp), 0];
    if ((time - _timestamp) <= selectRandom [10, 15, 20, 25, 30]) exitWith {};

    if ([_this] call CFUNC(inBuildingStrict)) exitWith {
        _this setUnitPos "UP";
        _this setVariable [QGVAR(stanceTimestamp), time];
    };

    private _target = assignedTarget _this;
    private _distanceProb = linearConversion [0, 1000, (_this distance _target), 0, 1, true];

    if ((_this distance _target) >= 300 && random 1 <= _distanceProb) then {
        _this setUnitPos "DOWN";
    } else {
        _this setUnitPos (selectRandom ["UP", "MIDDLE"]);
    };

    _this setVariable [QGVAR(hasStance), true];
    _this setVariable [QGVAR(stanceTimestamp), time];
}, {}, {}, "CombatStance"] call CBA_statemachine_fnc_addState;

[GVAR(stateMachine), {
    // Don't overide explicitly set stance
    private _hasStance = _this getVariable [QGVAR(hasStance), false];
    if (!_hasStance && toLower (unitPos _this) != "auto") exitWith {
        DEBUG_TAG("Skip stance");
    };

    DEBUG_TAG("Idle stance");
    _this setUnitPos "UP";
    _this setVariable [QGVAR(hasStance), true];
}, {}, {}, "IdleStance"] call CBA_statemachine_fnc_addState;

[GVAR(stateMachine), "Initial", "IdleStance", {isNull (assignedTarget _this)}] call CBA_statemachine_fnc_addTransition;
[GVAR(stateMachine), "Initial", "CombatStance", {!isNull (assignedTarget _this)}] call CBA_statemachine_fnc_addTransition;
[GVAR(stateMachine), "IdleStance", "CombatStance", {!isNull (assignedTarget _this)}] call CBA_statemachine_fnc_addTransition;
[GVAR(stateMachine), "CombatStance", "IdleStance", {isNull (assignedTarget _this)}] call CBA_statemachine_fnc_addTransition;
