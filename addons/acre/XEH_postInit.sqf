#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

// Exit if ACRE isn't loaded
if (isNil "acre_api_fnc_setFullDuplex") exitWith {};

["acre", "radio"] call CFUNC(registerChatCommand);

[{isDedicated || !isNull player}, {
    [ACRE_LOSSMODELSCALE] call acre_api_fnc_setLossModelScale;
    [ACRE_FULLDUPLEX] call acre_api_fnc_setFullDuplex;
    [ACRE_REVEALTOAI] call acre_api_fnc_setRevealToAI;
    [ACRE_INTERFERENCE] call acre_api_fnc_setInterference;
    [ACRE_IGNOREANTENNADIRECTION] call acre_api_fnc_ignoreAntennaDirection;

    call FUNC(setupPresets);

    if (hasInterface) then {
        {_x call acre_api_fnc_babelAddLanguageType} forEach [
            ["english", "English"],
            ["russian", "Russian"],
            ["greek", "Greek"]
        ];

        call FUNC(clientInit);

        if (alive player) then {
            [false] call acre_api_fnc_setSpectator;
        };
    };
}, []] call CBA_fnc_waitUntilAndExecute;
