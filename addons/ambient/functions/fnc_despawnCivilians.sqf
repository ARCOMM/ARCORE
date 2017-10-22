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
 * [] call arcore_ambient_fnc_despawnCivilians;
 *
 * Public: Yes
 */

private ["_civilians", "_civilian", "_despawnDistance"];

_civilians = player getVariable ["ARCORE_ambient_civilians", []];
_despawnDistance = getNumber (getMissionConfig "CfgARCMF" >> "Ambient" >> "Civilians" >> "despawnDistance");

{
    _civilian = _x;

    _keep = false;
    {
        if (_x distance _civilian < _despawnDistance) then
        {
            _keep = true;
        };
    }
    forEach allPlayers;

    if (!_keep) then
    {
        _group = group _civilian;
        deleteVehicle _civilian;
        deleteGroup _group;

        _civilians = _civilians - [_civilian];
    };
}
forEach _civilians;

player setVariable ["ARCORE_ambient_civilians", _civilians];

false
