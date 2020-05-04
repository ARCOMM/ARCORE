#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

if (!hasInterface) exitWith {};

["group", "groupname"] call CFUNC(registerChatCommand);
["group", "groupcolor"] call CFUNC(registerChatCommand);

private _faction = [playerSide] call CFUNC(getFaction);
private _groupEnabled = [format ["markers.%1.enableGroupMarkers", _faction], true] call CFUNC(configOption);

if (_groupEnabled && {playerSide in [west, east, resistance, civilian]}) then {
    [FUNC(updateGroupMarkers), 1, []] call CBA_fnc_addPerFrameHandler;
};

[player] call FUNC(setTeamColor);

if (leader player == player) then {
    private _group = group player;
    private _text = _group getVariable [QGVAR(text), groupId _group];
    _group setGroupIdGlobal [_text, "GroupColor0"];
};

[{time > 0}, {
    [side group player] call FUNC(createRoster);
}] call CBA_fnc_waitUntilAndExecute;
