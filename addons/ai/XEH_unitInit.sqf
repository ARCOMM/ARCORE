#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

params [["_unit", objNull]];

[_unit] call FUNC(assignLoadout);

if (leader _unit isEqualTo _unit) then {
    private _group = group _unit;
    private _garrisonEnabled = _group getVariable [QGVAR(GarrisonEnabled), false];

    removeAllWeapons _unit;

    if (_garrisonEnabled) then {
        removeUniform _unit;
        private _radius = _group getVariable [QGVAR(GarrisonRadius), 250];
        [_unit, nil, _unit, _radius] call FUNC(garrison);
        removeVest _unit;
    };
};
