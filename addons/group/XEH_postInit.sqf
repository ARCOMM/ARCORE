#include "script_component.hpp"

if (!hasInterface) exitWith {};

EXIT_IF_NOT_ARCMF;

["group", "groupname"] call CFUNC(registerChatCommand);
["group", "groupcolor"] call CFUNC(registerChatCommand);

[FUNC(updateGroupMarkers), 1, []] call CBA_fnc_addPerFrameHandler;
[FUNC(updateFireteamMarkers), 0.2, []] call CBA_fnc_addPerFrameHandler;
