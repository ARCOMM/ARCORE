/*
 * Author: Kingsley
 * Applies the given loadout.
 *
 * Arguments:
 * Console arguments.
 *
 * Return Value:
 * Void
 *
 * Public: No
 */

#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

params ["_arg"];

private _parts = _arg splitString " ";
if (_parts isEqualTo []) exitWith {};
_parts params ["_type", "_player"];

private _unit = [_type] call CFUNC(getPlayerByName);

if (count _parts == 1 && {isNull _unit}) then {
    // Give loadout to local player
    [ace_player, _type] call FUNC(assignLoadout);
    format ["%1 received loadout '%2' from chat", name ace_player, _type] remoteExecCall [QCFUNC(systemChatAdmin), 0];
} else {
    if (count _parts == 1 && {!isNull _unit}) then {
        // Get loadout from given player
        private _loadout = getUnitLoadout _unit;
        ace_player setUnitLoadout _loadout;
        format ["%1 copied loadout from %2", name ace_player, name _unit] remoteExecCall [QCFUNC(systemChatAdmin), 0];
    } else {
        if (count _parts == 2 && {!isNull _unit}) then {
            // Give loadout from _unit to _recipient
            private _recipient = [_player] call CFUNC(getPlayerByName);
            if (isNull _recipient) exitWith {};
            private _loadout = getUnitLoadout _unit;
            _recipient setUnitLoadout _loadout;
            format ["%1 copied loadout from %2 (via %3)", name _recipient, name _unit, name ace_player] remoteExecCall [QCFUNC(systemChatAdmin), 0];
        };
    };
};
