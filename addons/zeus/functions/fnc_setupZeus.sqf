/*
 * Author: BourbonWarfare
 * Sets up the Zeus interface
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Open? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call arcore_zeus_fnc_openZeus;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_giveZeus", "_slot"];

if (!isServer) exitWith {};
if (isNull _unit) exitWith {};

private _module = missionNamespace getVariable [format ["%1%2", QGVAR(zeusModule), _slot], objNull];

if (_slot == 1) then {
    GVAR(zeusModule1) = getAssignedCuratorLogic _unit;
} else {
    GVAR(zeusModule2) = getAssignedCuratorLogic _unit;
};

if (_slot == 1) then {
    if (_giveZeus) then {
        if (isNull GVAR(zeusModule1)) then {
            private _moduleGroup = createGroup GVAR(zeusCenter);

            GVAR(zeusModule1) = _moduleGroup createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"];
            GVAR(zeusModule1) setVariable ["Owner", "-1"];
            GVAR(zeusModule1) setVariable ["Name", ""];
            GVAR(zeusModule1) setVariable ["Addons", 3];
            GVAR(zeusModule1) setVariable ["Forced", 0];

            _unit assignCurator GVAR(zeusModule1);
            publicVariable QGVAR(zeusModule1);
        };
    } else {
        if (!isNull GVAR(zeusModule1)) then {
            unassignCurator GVAR(zeusModule1);
            deleteVehicle GVAR(zeusModule1);
            GVAR(zeusModule1) = objNull;
            publicVariable QGVAR(zeusModule1);
        };
    };
} else {
    if (_giveZeus) then {
        if (isNull GVAR(zeusModule2)) then {
            private _moduleGroup = createGroup GVAR(zeusCenter);

            GVAR(zeusModule2) = _moduleGroup createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"];
            GVAR(zeusModule2) setVariable ["Owner", "-1"];
            GVAR(zeusModule2) setVariable ["Name", ""];
            GVAR(zeusModule2) setVariable ["Addons", 3];
            GVAR(zeusModule2) setVariable ["Forced", 0];

            _unit assignCurator GVAR(zeusModule2);
            publicVariable QGVAR(zeusModule2);
        };
    } else {
        if (!isNull GVAR(zeusModule2)) then {
            unassignCurator GVAR(zeusModule2);
            deleteVehicle GVAR(zeusModule2);
            GVAR(zeusModule2) = objNull;
            publicVariable QGVAR(zeusModule2);
        };
    };
};
