#include "script_component.hpp"

if (!isServer && hasInterface) exitWith {};

#ifdef DEBUG_MODE_FULL
    call FUNC(handleDebugTags);
#endif

GVAR(stateMachine) = [{
    allUnits select {!isPlayer _x && local _x}
}, true] call CBA_statemachine_fnc_create;

[GVAR(stateMachine), {}, {}, {}, "Initial"] call CBA_statemachine_fnc_addState;

call FUNC(sys_stance);
call FUNC(sys_movement);

private _waypointStateMachine = [{
    allGroups select {({isPlayer _x} count units _x) == 0}
}, true] call CBA_statemachine_fnc_create;

[_waypointStateMachine, "Initial", "Initial", {true}, {
    {
        systemChat format ["Waypoint Statement %1", _x];
        _x setWaypointStatements ["true", format ["deleteWaypoint %1", _x]];
    } forEach waypoints _this;
}] call CBA_statemachine_fnc_addTransition;
