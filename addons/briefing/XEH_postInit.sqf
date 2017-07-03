#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

//--- Briefing Diary Records
[side group player] call FUNC(createBriefing);
[] call FUNC(createFrameworkBriefing);

//--- Briefing Stage Safety
if (isServer) then {
    private _timer = ["BriefingTimer"] call CFUNC(getMissionParam);
    if (_timer isEqualType 0 && {_timer > -1}) then {
        [_timer] call FUNC(startBriefingStage);
    };
} else {
    if (!isNil QGVAR(briefingEnded) && {!GVAR(briefingEnded)}) then {
        [player, true] call CFUNC(setSafety);
    };
};
