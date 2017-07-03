/*
 * Author: Kingsley
 *
 *
 * Arguments:
 *
 *
 * Return Value:
 *
 *
 * Example:
 * [] call arcore_ai_fnc_selectAttachments;
 *
 * Public:
 */

#include "script_component.hpp"

params [
    ["_faction", "blufor"],
    ["_category", "uniforms"]
];

private _result = [];
private _items = getArray (missionConfigFile >> "CfgARCMF" >> "AI" >> "Gear" >> _faction >> _category);

if (count _items > 0) then {
    {
        _class = _x select 0;
        _prob = _x select 1;
        _rand = random 1;

        if (_rand <= _prob) exitWith {
            _result pushBack _class;
        };
    } forEach _items;
} else {
    _result = [];
};

_result
