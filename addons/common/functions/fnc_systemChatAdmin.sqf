/*
 * Author: Kingsley
 * System chats the given message only if the player is admin.
 *
 * Arguments:
 * 0: Message <STRING>
 * 1: Broadcast <BOOLEAN>
 *
 * Return Value:
 * Void
 *
 * Example:
 * ["message"] call arcore_main_fnc_systemChatAdmin;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_message", "", [""]], ["_broadcast", false, [false]]];

if (_broadcast) exitWith {
    [_message] remoteExecCall [QFUNC(systemChatAdmin), 0];
};

if (serverCommandAvailable "#logout" || {isServer}) exitWith {
    systemChat _message;
};
