#include "script_component.hpp"

params [["_unit", objNull]];

if (isNull _unit || {!local _unit} || {isPlayer _unit}) exitWith {};

[{
    [{
        params ["_unit"];

        [_unit] call FUNC(assignLoadout);

        _unit setUnitPos "UP";
        _unit disableAI "AUTOCOMBAT";
        _unit disableAI "SUPPRESSION";
        _unit setBehaviour "AWARE";
        _unit setCombatMode "RED";
        _unit setSpeedMode "FULL";
        _unit allowFleeing 0;

        if (leader _unit isEqualTo _unit) then {
            private _group = group _unit;
            private _garrisonEnabled = _group getVariable [QGVAR(GarrisonEnabled), false];

            if (_garrisonEnabled) then {
                private _radius = _group getVariable [QGVAR(GarrisonRadius), 250];
                [_unit, nil, _unit, _radius] call FUNC(garrison);
            };
        };

        if (vehicle _unit != _unit) then {
            vehicle _unit allowCrewInImmobile true;
        };

        _unit addEventHandler ["Reloaded", {
            params [["_unit", objNull], "_weapon", "_muzzle", "_newMag", ["_oldMag", [""]]];
            if (isNull _unit) exitWith {};
            if (!isPlayer _unit && {_oldMag isEqualType []} && {count _oldMag > 0} && {(_oldMag select 0) isEqualType ""}) then {
                _unit addMagazine [(_oldMag select 0), 1E6];
            };
        }];
    }, _this] call CBA_fnc_execNextFrame;
}, [_unit]] call CBA_fnc_execNextFrame;
