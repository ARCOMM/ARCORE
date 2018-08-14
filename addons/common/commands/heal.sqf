/*
 * Author: Kingsley
 * Heals the player.
 */

#include "script_component.hpp"

params [["_name", ""]];

if (isNil QEGVAR(briefing,briefingEnded) || {EGVAR(briefing,briefingEnded)}) exitWith {
    systemChat "Cannot use heal when not in briefing stage";
};

if (_name isEqualTo "") then {
    [ace_player, ace_player] call ace_medical_fnc_treatmentAdvanced_fullHeal;
    ace_player setDamage 0;
    [format ["%1 healed himself via chat", name ace_player], true] call CFUNC(systemChatAdmin);
} else {
    private _unit = [_name] call FUNC(getPlayerByName);
    if (isNull _unit) exitWith {};
    [_unit, _unit] call ace_medical_fnc_treatmentAdvanced_fullHeal;
    _unit setDamage 0;
    [format ["%1 healed %2 via chat", name ace_player, name _unit], true] call CFUNC(systemChatAdmin);
};
