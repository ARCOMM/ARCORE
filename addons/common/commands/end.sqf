/*
 * Author: Kingsley
 * Ends the mission with the given status.
 *
 * Arguments:
 * Console arguments.
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_type", ""]];

private _map = [
    ["b", QEGVAR(main,blufor)],
    ["o", QEGVAR(main,opfor)],
    ["i", QEGVAR(main,indfor)],
    ["c", QEGVAR(main,completed)],
    ["f", QEGVAR(main,failed)],
    ["d", QEGVAR(main,draw)]
];

private _firstChar = toLower (_type select [0, 1]);
private _ending = ((_map select {(_x select 0) == _firstChar}) param [0, []]) param [1, QEGVAR(main,completed)];

[_ending] remoteExec ["BIS_fnc_endMission", 0];
