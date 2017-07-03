/*
 * Author: Kingsley
 * Sets up the preset channel names.
 */

#include "script_component.hpp"

{
    private _radioName = _x;

    {
        [_radioName, "default2", (_forEachIndex + 1), "label", _x] call acre_api_fnc_setPresetChannelField;
        [_radioName, "default3", (_forEachIndex + 1), "label", _x] call acre_api_fnc_setPresetChannelField;
        [_radioName, "default4", (_forEachIndex + 1), "label", _x] call acre_api_fnc_setPresetChannelField;
    } forEach [
        "COMMAND",
        "1ST PLATOON",
        "2ND PLATOON",
        "ALPHA",
        "BRAVO",
        "CHARLIE",
        "DELTA",
        "ECHO",
        "FOXTROT",
        "PHANTOM",
        "RAVEN",
        "GAMBLER",
        "MMG",
        "MAT",
        "BACKUP 1",
        "BACKUP 2"
    ];
} forEach ["ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC117F"];
