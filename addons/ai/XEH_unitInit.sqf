#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

params [["_unit", objNull]];

if (isNull _unit || {!local _unit} || {isPlayer _unit}) exitWith {};

[_unit] call FUNC(assignLoadout);

[{
    [{
        params ["_unit"];

        if (leader _unit isEqualTo _unit) then {
            private _group = group _unit;
            private _garrisonEnabled = _group getVariable [QGVAR(GarrisonEnabled), false];

            if (_garrisonEnabled) then {
                private _radius = _group getVariable [QGVAR(GarrisonRadius), 250];
                [_unit, nil, _unit, _radius] call FUNC(garrison);
            };
        };
    }, _this] call CBA_fnc_execNextFrame;
}, [_unit]] call CBA_fnc_execNextFrame;
