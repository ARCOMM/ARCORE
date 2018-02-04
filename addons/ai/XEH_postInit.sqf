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
