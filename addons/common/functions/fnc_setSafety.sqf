/*
 * Author: Kingsley
 * Sets the safety mode of the given unit
 * Must be executed where the unit is local
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Enabled <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call arcore_common_fnc_setSafety;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_enabled", true, [true]]];

if (isNull _unit || {!local _unit}) exitwith {};

switch (_enabled) do {
    case true: {
        _unit allowDamage false;
        if (isNil QGVAR(firedEH)) then {
            GVAR(firedEH) = _unit addEventHandler["Fired", {deleteVehicle (_this select 6)}];
        };
    };
    case false: {
        _unit allowDamage true;
        if (!isNil QGVAR(firedEH)) then {
            _unit removeEventHandler ["Fired", GVAR(firedEH)];
            GVAR(firedEH) = nil;
        };
    };
};
