#include "script_component.hpp"

// Exit if ACRE isn't loaded
if (isNil "acre_api_fnc_setFullDuplex") exitWith {};

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
