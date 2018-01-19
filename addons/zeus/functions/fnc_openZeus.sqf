/*
 * Author: BourbonWarfare
 * Opens the Zeus interface
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_zeus_fnc_openZeus;
 *
 * Public: No
 */

#include "script_component.hpp"

private _curator = getAssignedCuratorUnit GVAR(zeusModule);
if (!isNull _curator && _curator != player) exitWith {};

private _giveZeus = isNull getAssignedCuratorLogic player;

while {dialog} do {
    closeDialog 0;
};

[player, _giveZeus] remoteExec [QFUNC(setupZeus), 2];

if (_giveZeus) then {
    hintSilent "Press your Zeus key";
    [player, ["Mars", ["Log", format ["%1 logged into Zeus", name player]]]] remoteExecCall ["createDiaryRecord", 0];
} else {
    hintSilent "Logged out of Zeus";
    [player, ["Mars", ["Log", format ["%1 logged out of Zeus", name player]]]] remoteExecCall ["createDiaryRecord", 0];
};

[{hintSilent ""}, [], 5] call CBA_fnc_waitAndExecute;
