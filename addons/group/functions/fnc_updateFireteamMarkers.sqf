/*
 * Author: Kingsley
 * Updates the fireteam markers
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_group_fnc_updateFireteamMarkers;
 *
 * Public: No
 */

#include "script_component.hpp"

{deleteMarkerLocal _x; false} count GVAR(fireteamMarkers);

GVAR(fireteamMarkers) = [];

private _markerIndex = 0;
private _enabled = group player getVariable [QGVAR(ftEnabled), false];

if (!_enabled) exitWith {};

{
    private _unit = _x;
    private _distance = (group _unit) getVariable [QGVAR(ftDistance), 150];
    private _marker = format ["%1_%2", QGVAR(fireteam_marker), _markerIndex];
    private _markerColor = ["ColorWhite","ColorRed","ColorGreen","ColorBlue","ColorYellow"] select (["MAIN","RED","GREEN","BLUE","YELLOW"] find assignedTeam _unit) max 0;
    private _markerIcon = [_unit] call CFUNC(getUnitMarker);
    private _markerPos = getPos _unit;
    private _markerAlpha = linearConversion [
        0,
        _distance,
        (_unit distance player),
        1,
        0,
        true
    ];

    _marker = createMarkerLocal [_marker, _markerPos];
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal _markerIcon;
    _marker setMarkerColorLocal _markerColor;
    _marker setMarkerSizeLocal [0.88, 0.88];
    _marker setMarkerDirLocal (direction _unit);
    _marker setMarkerAlphaLocal _markerAlpha;

    GVAR(fireteamMarkers) pushBack _marker;
    INC(_markerIndex);

    false
} count ((units group player) select {alive _x});
