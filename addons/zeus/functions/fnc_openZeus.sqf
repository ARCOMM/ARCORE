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

params [["_slot", 1, [1]]];

private _module = missionNamespace getVariable [format ["%1%2", QGVAR(zeusModule), _slot], objNull];
private _curator = getAssignedCuratorUnit _module;
if (!isNull _curator && _curator != player) exitWith {};

private _giveZeus = isNull getAssignedCuratorLogic player;

while {dialog} do {
    closeDialog 0;
};

[player, _giveZeus, _slot] remoteExec [QFUNC(setupZeus), 2];

if (_giveZeus) then {
    hintSilent "Press your Zeus key";
    [player, ["Mars", ["Log", format ["%1 logged into Zeus", name player]]]] remoteExecCall ["createDiaryRecord", 0];
} else {
    hintSilent "Logged out of Zeus";
    [player, ["Mars", ["Log", format ["%1 logged out of Zeus", name player]]]] remoteExecCall ["createDiaryRecord", 0];
};

[{hintSilent ""}, [], 5] call CBA_fnc_waitAndExecute;
