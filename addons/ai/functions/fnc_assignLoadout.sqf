/*
 * Author: Kingsley
 * Assigns the AI loadout using the mission config.
 *
 * Arguments:
 * See XEH
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_ai_fnc_assignLoadout;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_unit", objNull]];

if (isNull _unit || {!local _unit} || {isPlayer _unit}) exitWith {};

private _faction = [_unit] call CFUNC(getFaction);
private _enabled = (missionConfigFile >> "CfgARCMF" >> "AI" >> "Gear" >> _faction >> "enabled");

if (isNull _enabled || {getNumber _enabled != 1}) exitWith {};

private _prioritizeTracerMags = getNumber (missionConfigFile >> "CfgARCMF" >> "AI" >> "Gear" >> _faction >> "prioritizeTracerMags") == 1;
private _removeMedicalItems = getNumber (missionConfigFile >> "CfgARCMF" >> "AI" >> "Gear" >> _faction >> "removeMedicalItems") == 1;
private _removeNightVision = getNumber (missionConfigFile >> "CfgARCMF" >> "AI" >> "Gear" >> _faction >> "removeNightVision") == 1;

private _rifleClass = [_faction, "rifles"] call FUNC(selectItem);
private _hasRemovedWeapons = false;

if (count _rifleClass > 0) then {
    removeAllWeapons _unit;
    _hasRemovedWeapons = true;
};

private _uniformItems = uniformItems _unit;
private _vestItems = vestItems _unit;
private _backpackItems = backpackItems _unit;

private _uniformClass = [_faction, "uniforms"] call FUNC(selectItem);
if (count _uniformClass > 0) then {
    removeUniform _unit;
    _unit forceAddUniform (_uniformClass select 0);
    {_unit addItemToUniform _x} forEach _uniformItems;
};

private _vestClass = [_faction, "vests"] call FUNC(selectItem);
if (count _vestClass > 0) then {
    removeVest _unit;
    _unit addVest (_vestClass select 0);
    {_unit addItemToVest _x} forEach _vestItems;
};

private _backpackClass = [_faction, "backpacks"] call FUNC(selectItem);
if (count _backpackClass > 0) then {
    removeBackpack _unit;
    _unit addBackpack (_backpackClass select 0);
    {_unit addItemToBackpack _x} forEach _backpackItems;
};

private _hasHeadgear = false;
private _headgearClass = [_faction, "headgear"] call FUNC(selectItem);
if (count _headgearClass > 0) then {
    removeHeadgear _unit;
    _unit addHeadgear (_headgearClass select 0);
    _hasHeadgear = true;
};

if (!_hasHeadgear) then {
    private _goggleClass = [_faction, "goggles"] call FUNC(selectItem);
    if (count _goggleClass > 0) then {
        removeGoggles _unit;
        _unit addGoggles (_goggleClass select 0);
    };
};

private _faceClass = [_faction, "faces"] call FUNC(selectItem);
if (count _faceClass > 0) then {
    _unit setFace (_faceClass select 0);
};

private _voiceClass = [_faction, "voices"] call FUNC(selectItem);
if (count _voiceClass > 0) then {
    _unit setSpeaker (_voiceClass select 0);
};

private _whileAddMagazine = {
    params ["_unit", "_magazine", "_count"];
    for "_i" from 0 to _count do {
        _unit addMagazine _magazine;
    };
};

private _launcherClass = [_faction, "launchers"] call FUNC(selectItem);
if (count _launcherClass > 0) then {
    if (!_hasRemovedWeapons) then {
        removeAllWeapons _unit;
        _hasRemovedWeapons = true;
    };

    [_unit, (_launcherClass select 0), 2] call BIS_fnc_addWeapon;
};

if (count _rifleClass > 0) then {
    if (!_hasRemovedWeapons) then {
        removeAllWeapons _unit;
        _hasRemovedWeapons = true;
    };

    private _magazines = getArray (configFile >> "CfgWeapons" >> (_rifleClass select 0) >> "magazines");

    if (count _magazines > 0) then {
        _useMagazine = "";
        _standard = [];
        _tracers = [];

        {
            if (getNumber (configFile >> "CfgMagazines" >> _x >> "tracersEvery") == 1) then {
                _tracers pushBack _x;
            } else {
                _standard pushBack _x;
            };
        } forEach _magazines;

        private _useMagazine = if (_prioritizeTracerMags && ((count _tracers) > 0)) then {(_tracers select 0)} else {(_standard select 0)};
        [_unit, _useMagazine, 6] call _whileAddMagazine;
        _unit addWeapon (_rifleClass select 0);
    };
};

private _attachments = [_faction, "attachments"] call FUNC(selectAttachments);
{_unit addPrimaryWeaponItem _x} forEach _attachments;

if (_removeMedicalItems) then {
    {_unit removeItem _x} forEach ["ACE_fieldDressing", "ACE_morphine", "ACE_epinephrine"];
};

if (_removeNightVision) then {
    private _nvgoggles = "getText (_x >> 'simulation') == 'NVGoggles'" configClasses (configFile >> "CfgWeapons");
    {_unit unlinkItem (configName _x)} forEach _nvgoggles;
};

_unit setVariable [QGVAR(done), true, true];
