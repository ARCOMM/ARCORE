#include "script_component.hpp"

if (hasInterface) then {
    if (getNumber (missionConfigFile >> "respawn") == 3) then {
        if (getNumber (missionConfigFile >> "Header" >> "sandbox") == 1) then {
            ["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

            _startPos = [getArray (missionConfigFile >> "CfgSandbox" >> worldName >> "startingPosition"), 10] call CBA_fnc_randPos;
            player setPos _startPos;
        };
    };
};
