#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

if (hasInterface) then {
    if (getNumber (missionConfigFile >> "respawn") == 3) then {
        if (SANDBOX_MODE) then {
            ["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

            _startPos = call FUNC(getSpawnPos);
            player setPos _startPos;
        };
    };
};
