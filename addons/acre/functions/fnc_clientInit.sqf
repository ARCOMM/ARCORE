/*
 * Author: Kingsley
 * Inits the client radio stuff.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_acre_fnc_clientInit;
 *
 * Public: No
 */

#include "script_component.hpp"

#define RADIO_343 "ACRE_PRC343"
#define RADIO_148 "ACRE_PRC148"
#define RADIO_152 "ACRE_PRC152"
#define RADIO_117F "ACRE_PRC117F"
#define RADIO_77 "ACRE_PRC77"

private _unit = player;
private _presetName = switch (side _unit) do {
    case west: {"default2"};
    case east: {"default3"};
    case resistance: {"default4"};
    default {"default"};
};

if (false/* TODO disableFrequencySplit */) then {
    _presetName = "default";
};

[RADIO_343, _presetName] call acre_api_fnc_setPreset;
[RADIO_148, _presetName] call acre_api_fnc_setPreset;
[RADIO_152, _presetName] call acre_api_fnc_setPreset;
[RADIO_117F, _presetName] call acre_api_fnc_setPreset;
["ItemRadio", _presetName] call acre_api_fnc_setPreset;

if (!alive _unit) exitWith {
    [true] call acre_api_fnc_setSpectator;
};

private _config = (missionConfigFile >> "CfgARCMF" >> "ACRE");

switch (side _unit) do {
    case west: {
        private _langs = getArray (_config >> "BLUFOR" >> "languages");
        _langs call acre_api_fnc_babelSetSpokenLanguages;
        [_langs select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    };

    case east: {
        private _langs = getArray (_config >> "OPFOR" >> "languages");
        _langs call acre_api_fnc_babelSetSpokenLanguages;
        [_langs select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    };

    case resistance: {
        private _langs = getArray (_config >> "INDFOR" >> "languages");
        _langs call acre_api_fnc_babelSetSpokenLanguages;
        [_langs select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    };

    default {
        private _langs = getArray (_config >> "BLUFOR" >> "languages");
        _langs call acre_api_fnc_babelSetSpokenLanguages;
        [_langs select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    };
};

[{
    (player getVariable [QEGVAR(loadout,done), false]) &&
    !("ItemRadio" in (items player + assignedItems player)) &&
    call acre_api_fnc_isInitialized
}, {
    params ["_unit"];

    private _typeOfUnit = toLower (_unit getVariable [QEGVAR(loadout,loadout), "NIL"]);
    {_unit removeItem _x} forEach (call acre_api_fnc_getCurrentRadioList);

    _AN_PRC_343 = switch (side _unit) do {
        case west: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "BLUFOR" >> "AN_PRC_343")};
        case east: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "OPFOR" >> "AN_PRC_343")};
        case resistance: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "INDFOR" >> "AN_PRC_343")};
        default {[]};
    };

    _AN_PRC_148 = switch (side _unit) do {
        case west: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "BLUFOR" >> "AN_PRC_148")};
        case east: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "OPFOR" >> "AN_PRC_148")};
        case resistance: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "INDFOR" >> "AN_PRC_148")};
        default {[]};
    };

    _AN_PRC_152 = switch (side _unit) do {
        case west: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "BLUFOR" >> "AN_PRC_152")};
        case east: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "OPFOR" >> "AN_PRC_152")};
        case resistance: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "INDFOR" >> "AN_PRC_152")};
        default {[]};
    };

    _AN_PRC_117F = switch (side _unit) do {
        case west: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "BLUFOR" >> "AN_PRC_117F")};
        case east: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "OPFOR" >> "AN_PRC_117F")};
        case resistance: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "INDFOR" >> "AN_PRC_117F")};
        default {[]};
    };

    _AN_PRC_77 = switch (side _unit) do {
        case west: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "BLUFOR" >> "AN_PRC_77")};
        case east: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "OPFOR" >> "AN_PRC_77")};
        case resistance: {getArray (missionConfigFile >> "CfgARCMF" >> "ACRE" >> "INDFOR" >> "AN_PRC_77")};
        default {[]};
    };

    #define ADD_RADIO(ARCROLE, RADIO)\
        ARCROLE = ARCROLE apply {toLower _x};\
			if ((count (ARCROLE select {_x == _typeOfUnit}) == 1) || (count ARCROLE == 1 && toLower (ARCROLE select 0) == "all"))\
			then {_unit addItem RADIO;}\
			else {for "_i" from 1 to count (ARCROLE select {_x == _typeOfUnit})\ 
				do {_unit addItem RADIO;};\
        };

    if (_typeOfUnit != "NIL") then {
        if ((_typeOfUnit in _AN_PRC_343) || (count _AN_PRC_343 == 1 && toLower (_AN_PRC_343 select 0) == "all")) then {
            if (_unit canAdd RADIO_343) then {
                ADD_RADIO(_AN_PRC_343, RADIO_343);
            };
        };

        if ((_typeOfUnit in _AN_PRC_148) || (count _AN_PRC_148 == 1 && toLower (_AN_PRC_148 select 0) == "all")) then {
            if (_unit canAdd RADIO_148) then {
                ADD_RADIO(_AN_PRC_148, RADIO_148);
            };
        };

        if ((_typeOfUnit in _AN_PRC_152) || (count _AN_PRC_152 == 1 && toLower (_AN_PRC_152 select 0) == "all")) then {
            if (_unit canAdd RADIO_152) then {
                ADD_RADIO(_AN_PRC_152, RADIO_152);
            };
        };

        if ((_typeOfUnit in _AN_PRC_117F) || (count _AN_PRC_117F == 1 && toLower (_AN_PRC_117F select 0) == "all")) then {
            if (_unit canAdd RADIO_117F) then {
                ADD_RADIO(_AN_PRC_117F, RADIO_117F);
            };
        };

        if ((_typeOfUnit in _AN_PRC_77) || (count _AN_PRC_77 == 1 && toLower (_AN_PRC_77 select 0) == "all")) then {
            if (_unit canAdd RADIO_77) then {
                ADD_RADIO(_AN_PRC_77, RADIO_77);
            };
        };
    };
}, [_unit]] call CBA_fnc_waitUntilAndExecute;
