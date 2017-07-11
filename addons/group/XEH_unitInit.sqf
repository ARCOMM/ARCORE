#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

params ["_unit"];

if (!local _unit || _unit != player) exitWith {};

[_unit] call FUNC(setTeamColor);

if (leader _unit == _unit) then {
    private _group = group _unit;
    private _text = _group getVariable [QGVAR(text), groupId _group];
    _group setGroupIdGlobal [_text, "GroupColor0"];
};

diag_log str allGroups;

[side group player] call FUNC(createRoster);
