#include "script_component.hpp"

if (isServer || !hasInterface) then {
    private _stateMachine = [{allUnits select {!isPlayer _x && local _x}}, true] call CBA_statemachine_fnc_create;

    [_stateMachine, {}, {}, {}, "Initial"] call CBA_statemachine_fnc_addState;
    // [_stateMachine, {}, {}, {}, "Stance"] call CBA_statemachine_fnc_addState;
    // [_stateMachine, {}, {
    //     _this enableAI "TARGET";
    // }, {}, "Moving"] call CBA_statemachine_fnc_addState;

    [_stateMachine, "Initial", "Initial", {!isNull (assignedTarget _this)}, {
        private _isMoving = _this getVariable [QGVAR(doingMove), false];
        if (_isMoving) exitWith {};

        private _timestamp = _this getVariable [QGVAR(stanceTimestamp), 0];
        if ((time - _timestamp) <= selectRandom [10, 15, 20, 25, 30]) exitWith {};

        if ([_this] call CFUNC(inBuildingStrict)) exitWith {
            _this setUnitPos "UP";
            _this setVariable [QGVAR(stanceTimestamp), time];
        };

        private _target = assignedTarget _this;
        private _distanceProb = linearConversion [0, 1000, (_this distance _target), 0, 1, true];

        if ((_this distance _target) >= 200 && random 1 <= _distanceProb) then {
            _this setUnitPos "DOWN";
        } else {
            _this setUnitPos (selectRandom ["UP", "MIDDLE"]);
        };

        _this setVariable [QGVAR(stanceTimestamp), time];
    }, "ShootingStance"] call CBA_statemachine_fnc_addTransition;

    [_stateMachine, "Initial", "Initial", {isNull (assignedTarget _this)}, {
        _this setUnitPos "UP";
    }, "IdleStance"] call CBA_statemachine_fnc_addTransition;

    [_stateMachine, "Initial", "Initial", {
        (count (waypoints group _this) > 1)
    }, {
        private _waypoints = waypoints group _this;
        private _pos = waypointPosition (_waypoints select 1);
        _this setVariable [QGVAR(doingMove), true];
        _this setUnitPos "UP";
        _this doMove _pos;
    }, "DoMove"] call CBA_statemachine_fnc_addTransition;
};
