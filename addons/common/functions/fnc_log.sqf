/*
 * Author: Kingsley
 * Logs the given message in everyone's diary.
 *
 * Arguments:
 * 0: Message <STRING>
 *
 * Return Value:
 * Void
 *
 * Example:
 * ["Keith is a shit player"] call arcore_main_fnc_log;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_message"];

[ace_player, "ARCMF", ["Log", _message]] remoteExecCall ["createDiaryRecord", 0];
