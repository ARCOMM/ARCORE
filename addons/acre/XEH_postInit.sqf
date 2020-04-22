#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

// Exit if ACRE isn't loaded
if (isNil "acre_api_fnc_setFullDuplex") exitWith {};


//What does the below line even do?
["acre", "radio"] call CFUNC(registerChatCommand);

[{isDedicated || !isNull player}, {
    
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
