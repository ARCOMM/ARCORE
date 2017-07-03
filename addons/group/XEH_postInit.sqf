#include "script_component.hpp"

if (!hasInterface) exitWith {};

EXIT_IF_NOT_ARCMF;

["group", "groupname"] call CFUNC(registerChatCommand);
["group", "groupcolor"] call CFUNC(registerChatCommand);

private _faction = [playerSide] call CFUNC(getFaction);
private _groupEnabled = getNumber (missionConfigFile >> "CfgARCMF" >> "Markers" >> _faction >> "enableGroupMarkers") == 1;

if (_groupEnabled) then {
    [FUNC(updateGroupMarkers), 1, []] call CBA_fnc_addPerFrameHandler;
    [FUNC(updateFireteamMarkers), 0.2, []] call CBA_fnc_addPerFrameHandler;
};
