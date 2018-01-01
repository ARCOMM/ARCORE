/*
 * Author: Jay
 *
 * Arguments:
 * none
 *
 * Return Value:
 * false
 *
 * Example:
 * [] call arcore_ambient_fnc_spawnCivilians;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_civilians", "_civilian", "_spawnDistance", "_despawnDistance", "_civiliansMax", "_civiliansPlayerMax"];

_position = position player;
_spawnDistance = getNumber (getMissionConfig "CfgARCMF" >> "Ambient" >> "Civilians" >> "spawnDistance");
_despawnDistance = getNumber (getMissionConfig "CfgARCMF" >> "Ambient" >> "Civilians" >> "despawnDistance");
_civiliansMax = getNumber (getMissionConfig "CfgARCMF" >> "Ambient" >> "Civilians" >> "totalMax");
_civiliansPlayerMax = getNumber (getMissionConfig "CfgARCMF" >> "Ambient" >> "Civilians" >> "perPlayerMax");

_inArea = false;
{
    if (_x find "ARCORE_ambient_civilians_" == 0) then
    {
        if (_position inArea _x) exitWith
        {
            _inArea = true;
        }
    }
}
forEach allMapMarkers;

_existing = nearestObjects [_position, ["C_Man_1"], _despawnDistance];
_civilians = player getVariable ["ARCORE_ambient_civilians", []];

if (_inArea &&
    count _existing < _civiliansMax &&
    count _civilians < _civiliansPlayerMax) then
{
    _civilian = [_position, _spawnDistance] call FUNC(initCivilian);
    _civilian = [_position, _spawnDistance] call FUNC(initCivilian);
};

false
