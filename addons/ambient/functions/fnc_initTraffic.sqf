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
 * [] call arcore_ambient_fnc_initTraffic;
 *
 * Public: Yes
 */

[] spawn
{
    private ["_spawnSecondsMax", "_spawnSecondsMin", "_vehicleTypes", "_startpoints", "_waypoints"];

    _spawnSecondsMax = getNumber (getMissionConfig "CfgARCMF" >> "Ambient" >> "Traffic" >> "spawnSecondsMax");
    _spawnSecondsMin = getNumber (getMissionConfig "CfgARCMF" >> "Ambient" >> "Traffic" >> "spawnSecondsMin");
    _vehicleTypes = getArray (getMissionConfig "CfgARCMF" >> "Ambient" >> "Traffic" >> "vehicleTypes");

    _startpoints = [];
    {
        if (_x find "ARCORE_ambient_traffic_spawn_" == 0) then
        {
            _startpoints pushBack [markerPos _x, markerDir _x];
            deleteMarker _x;
        };
    } forEach allMapMarkers;

    _waypoints = [];
    {
        if (_x find "ARCORE_ambient_traffic_wp_" == 0) then
        {
            _waypoints pushBack [markerPos _x, markerDir _x];
            deleteMarker _x;
        };
    } forEach allMapMarkers;

    while {count _startpoints > 0 && count _waypoints > 0} do {
        _startpoint = selectRandom _startpoints;
        _startPos = _startpoint select 0;
        _startDir = _startpoint select 1;
        _waypoint = selectRandom _waypoints;
        _wpPos = _waypoint select 0;
        _wpDir = _waypoint select 1;

        _vehicleType = selectRandom _vehicleTypes;
        _vehicleInfo = [_startPos, _startDir, _vehicleType, civilian] call BIS_fnc_spawnVehicle;
        _vehicle = _vehicleInfo select 0;
        _crew = _vehicleInfo select 1;
        _group = _vehicleInfo select 2;

        _wp = _group addWaypoint [_wpPos, 0];
        _wp setWaypointType "MOVE";
        _wp setWaypointStatements [
            "true",
            "{ deleteVehicle vehicle _x; deleteVehicle _x; } forEach thisList;"
        ];

        sleep (_spawnSecondsMin + random _spawnSecondsMax);
    };
};

false
