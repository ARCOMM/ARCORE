/*
 * Author: Kingsley
 * Whisper the given player.
 */

#include "script_component.hpp"

params ["_arg"];

private _parts = _arg splitString " ";
private _name = _parts select 0;

_parts deleteAt 0;

private _message = _parts joinString " ";
private _unit = [_name] call FUNC(getPlayerByName);

if (!isNull _unit) then {
    parseText format ["<t size='1.25'>Whisper from %1</t><br />%2", name ace_player, _message] remoteExecCall ["hint", _unit];
    systemChat format ["Whisper sent to %1", name _unit];
};
