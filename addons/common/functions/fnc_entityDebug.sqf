/*
 * Author: Kingsley
 * Displays debug information about the given entity.
 *
 * Arguments:
 * 0: Entity <ANY>
 *
 * Return Value:
 * PFH Handler ID
 *
 * Example:
 * _handler = [group player] call arcore_common_fnc_entityDebug;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_entity", player]];

private _handler = [{
    params ["_args", "_handler"];
    _args params ["_entity"];

    private _output = [];
    private _vars = (allVariables _entity) select {
        count _x >= 6 &&
        {toLower (_x select [0, 6]) == "arcore"}
    };

    {_output pushBack format [
        "%1: %2",
        _x,
        (_entity getVariable _x)
    ]} forEach _vars;

    hintSilent parseText (_output joinString "<br/>");
}, 0, [_entity]] call CBA_fnc_addPerFrameHandler;

_handler
