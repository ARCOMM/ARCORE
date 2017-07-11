#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

params ["_unit"];

if (!local _unit) exitWith {};

private _role = _unit getVariable [QGVAR(loadout), ""];
[_unit, _role] call FUNC(assignLoadout);
