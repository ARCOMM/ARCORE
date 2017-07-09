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

EXIT_IF_NOT_ARCMF;

params [["_unit", objNull]];

if (isNull _unit || {!local _unit} || {isPlayer _unit}) exitWith {};

private _faction = [_unit] call CFUNC(getFaction);
private _enabled = (missionConfigFile >> "CfgARCMF" >> "AI" >> "Gear" >> _faction >> "enabled");

if (isNull _enabled || {getNumber _enabled != 1}) exitWith {};

private _prioritizeTracerMags = getNumber (missionConfigFile >> "CfgARCMF" >> "AI" >> "Gear" >> _faction >> "prioritizeTracerMags") == 1;
private _removeMedicalItems = getNumber (missionConfigFile >> "CfgARCMF" >> "AI" >> "Gear" >> _faction >> "removeMedicalItems") == 1;
private _removeNightVision = getNumber (missionConfigFile >> "CfgARCMF" >> "AI" >> "Gear" >> _faction >> "removeNightVision") == 1;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

private _rifleClass = [_faction, "rifles"] call FUNC(selectItem);
private _needsBackpack = false;
private _addLauncher = false;

private _uniformClass = [_faction, "uniforms"] call FUNC(selectItem);
if (count _uniformClass > 0) then {
    _unit forceAddUniform (_uniformClass select 0);
};

private _vestClass = [_faction, "vests"] call FUNC(selectItem);
if (count _vestClass > 0) then {
    _unit addVest (_vestClass select 0);
};

private _launcherClass = [_faction, "launchers"] call FUNC(selectItem);
if (count _launcherClass > 0) then {
    _needsBackpack = true;
    _addLauncher = true;
};

private _backpackClass = [_faction, "backpacks", _needsBackpack] call FUNC(selectItem);
if (count _backpackClass > 0) then {
    _unit addBackpack (_backpackClass select 0);
};

if (_addLauncher) then {
    [_unit, (_launcherClass select 0), 2] call BIS_fnc_addWeapon;
};

private _hasHeadgear = false;
private _headgearClass = [_faction, "headgear"] call FUNC(selectItem);
if (count _headgearClass > 0) then {
    _unit addHeadgear (_headgearClass select 0);
    _hasHeadgear = true;
};

if (!_hasHeadgear) then {
    private _goggleClass = [_faction, "goggles"] call FUNC(selectItem);
    if (count _goggleClass > 0) then {
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

if (count _rifleClass > 0) then {
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
