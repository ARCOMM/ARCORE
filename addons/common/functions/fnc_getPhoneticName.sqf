/*
 * Author: Kingsley
 * Gets the phonetic name for the given letter
 *
 * Arguments:
 * 0: Letter <STRING>
 *
 * Return Value:
 * Phonetic name <STRING>
 *
 * Example:
 * ["a"] call arcore_common_fnc_getPhoneticName;
 * // "Alpha"
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_letter", "", [""]]];

if (_letter == "") exitWith {""};

private _alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];

if !(_letter in _alphabet) exitWith {""};

private _index = _alphabet find _letter;

((_index + 1) call BIS_fnc_phoneticalWord)
