#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

[{!isNil QEGVAR(group,hasRun) && {EGVAR(group,hasRun)}}, {
    [side group player] call FUNC(createRoster);
}] call CBA_fnc_waitUntilAndExecute;
