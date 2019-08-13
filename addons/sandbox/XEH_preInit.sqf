#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

EXIT_IF_NOT_ARCMF;

GVAR(enabled) = getNumber (missionConfigFile >> "Header" >> "sandbox") == 1;

if (isServer) then {
    private _spawnPos = call FUNC(getSpawnPos);

    if (getNumber (missionConfigFile >> "respawn") == 3) then {
        {
            if !(_x in allMapMarkers) then {
                createMarker [_x, _spawnPos];
            };
        } forEach ["respawn_west", "respawn_east", "respawn_guerrila"];

        if (SANDBOX_MODE) then {
            ["Initialize", [true]] call BIS_fnc_dynamicGroups;

            GVAR(arsenal) = createVehicle ["Land_PaperBox_open_full_F", _spawnPos, [], 0, "CAN_COLLIDE"];
            if (isClass (configfile >> "CfgPatches" >> "ace_arsenal")) then
            {
                [GVAR(arsenal), true, true] call ace_arsenal_fnc_initBox;
            } else
            {
                ["AmmoboxInit", [GVAR(arsenal), true]] spawn BIS_fnc_arsenal;
            };
            GVAR(arsenal) allowDamage false;
        };
    };
};
