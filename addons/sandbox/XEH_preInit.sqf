#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
    private _spawnPos = getArray (missionConfigFile >> "CfgSandbox" >> worldName >> "startingPosition");

    if (getNumber (missionConfigFile >> "respawn") == 3) then {
        {
            if !(_x in allMapMarkers) then {
                createMarker [_x, _spawnPos];
            };
        } forEach ["respawn_west", "respawn_east", "respawn_guerrila"];

        if (getNumber (missionConfigFile >> "Header" >> "sandbox") == 1) then {
            ["Initialize", [true]] call BIS_fnc_dynamicGroups;

            GVAR(arsenal) = createVehicle ["Land_PaperBox_open_full_F", _spawnPos, [], 0, "CAN_COLLIDE"];
            ["AmmoboxInit", [GVAR(arsenal), true]] spawn BIS_fnc_arsenal;
            GVAR(arsenal) allowDamage false;
        };
    };
};

ADDON = true;
