/*
 * Author: Kingsley
 * Converts the given string from camel case to title case.
 *
 * Arguments:
 * 0: String <STRING>
 * 1: Include spaces <BOOLEAN>
 *
 * Return Value:
 * String <STRING>
 *
 * Example:
 * ["someCamelCase", true] call arcore_common_fnc_camelToTitle;
 * // Some Camel Case
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_str", "", [""]], ["_spaces", true, [true]]];

private _chars = _str splitString "";
private _words = [];
private _word = [];

{
    // Char is uppercase
    if (toUpper _x isEqualTo _x) then {
        // Push back the previous word
        if !(_word isEqualTo []) then {
            _words pushBack _word;
            _word = [];
        };

        // Concatenate new word
        _word pushBack _x;
    } else {
        _word pushBack _x;
    };

    if (_forEachIndex == (count _chars - 1)) then {
        if !(_word isEqualTo []) then {
            _words pushBack _word;
            _word = [];
        };
    };
} forEach _chars;

_words = _words apply {
    _x set [0, toUpper (_x select 0)];
    (_x joinString "")
};

(_words joinString (["", " "] select _spaces))
