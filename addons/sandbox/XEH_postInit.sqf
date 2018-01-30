#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

if (hasInterface) then {
    if (getNumber (missionConfigFile >> "respawn") == 3) then {
        if (SANDBOX_MODE) then {
            ["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
            player setPos ([true] call FUNC(getSpawnPos));
        };
    };

    player addEventHandler ["Killed", {
        GVAR(playerLoadout) = getUnitLoadout (_this select 0);
    }];

    player addEventHandler ["Respawn", {
        (_this select 0) setUnitLoadout GVAR(playerLoadout);
        hintSilent "To spectate type #spec in chat and press enter.";
    }];
};
